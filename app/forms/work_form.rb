# frozen_string_literal: true

class WorkForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization
  include TagSelection

  attribute :title, :string
  attribute :description, :string
  attribute :published, :boolean

  # A blank title in a locale the work is not translated into means "not
  # translated yet", not "no title": the work keeps the one it has, and the
  # form leaves the box empty on purpose (see `TranslatedInputs`). It only
  # means no title when the default locale has none either — which, since
  # `HasTranslations` seeds that one from whichever locale writes first, is
  # exactly when nothing has ever been written.
  validates :title, presence: true, if: :title_required?

  # The last two are what `TranslatedInputs` asks a form for. Its third method,
  # `translation_of`, is deliberately not delegated: this form's own attributes
  # already hold the locale's value, and after an invalid submit they hold what
  # the admin typed, which the work knows nothing about.
  delegate :sections,
           :images,
           :id,
           :new_record?,
           :translated_attribute?,
           :untranslated_reference,
           to: :work

  # The work each form builds when none is passed in. Subclasses name their own
  # STI class: without this a `VisualWorkForm` would silently wrap an `ActionWork`.
  def self.work_class
    Work
  end

  def initialize(work: self.class.work_class.new)
    @work = work

    super()

    return if work.new_record?

    self.class.attribute_names.each do |attr_name|
      public_send("#{attr_name}=", read(attr_name))
    end
  end

  def submit(attrs)
    work.transaction do
      assign_attributes(attrs)

      raise ActiveRecord::Rollback unless validate

      work.assign_attributes(serializable_hash)

      unless work.save
        errors.merge!(work.errors)

        raise ActiveRecord::Rollback
      end

      save_nested_records
    end
  end

  def section_attributes=(assoc_attributes)
    set_attributes_for(association: work.sections, assoc_attributes:)
  end

  def image_attributes=(assoc_attributes)
    set_attributes_for(association: work.images, assoc_attributes:)
  end

  def submit_button_text
    "Guardar"
  end

  # Read by the validation above and by the form: SimpleForm marks a field
  # required from the model's validators and skips any carrying an `:if`, so
  # the box would lose the marker it has always had in the locale that does
  # require a title.
  def title_required?
    I18n.locale == I18n.default_locale ||
      work.translation_of(:title, locale: I18n.default_locale).blank?
  end

  private

  attr_reader :work

  # The work's own save writes any nested record it built, but not one that was
  # already persisted: `has_many` autosaves new children only.
  def save_nested_records
    sections.each { |section| save_or_destroy(section) }
    images.each { |image| save_or_destroy(image) }
  end

  # A nested record with nothing to write is left alone, but "nothing to write"
  # is not `has_changes_to_save?`: assigning an uploaded file to a
  # `has_one_attached` touches no column of its own, because ActiveStorage keeps
  # the change in `attachment_changes` and writes it from an `after_save` hook.
  # Guarding on the columns alone therefore skipped the save, and picking a new
  # file for an existing image kept the old one unless the same submit happened
  # to edit its credits, position or video too. `changed_for_autosave?` covers
  # the columns, the translations and the attachment alike.
  def save_or_destroy(record)
    return record.destroy! if record.marked_for_destruction?

    record.save! if record.changed_for_autosave?
  end

  # A translated attribute is read as the locale being edited itself holds it,
  # with no fallback: see `HasTranslations#translation_of`. Everything else —
  # `published`, `dimensions`, the year behind `realization_date` — has one
  # value whatever the locale, and is read straight off the work.
  def read(attr_name)
    return work.translation_of(attr_name) if work.translated_attribute?(attr_name)

    work.public_send(attr_name)
  end

  def set_attributes_for(association:, assoc_attributes:)
    assoc_attributes.each do |id, attributes|
      id = Integer(id)

      if id > 999_999_999_999_000
        association.build(attributes)

        next
      end

      record = association.find { |section| section.id == id }

      if ActiveModel::Type::Boolean.new.cast(attributes.delete(:_destroy))
        record.mark_for_destruction

        next
      end

      record.assign_attributes(attributes)
    end
  end
end
