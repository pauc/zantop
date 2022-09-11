# frozen_string_literal: true

class WorkForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization

  attribute :title, :string
  attribute :description, :string
  attribute :published, :boolean

  validates :title, presence: true

  delegate :sections,
           :images,
           :id,
           :new_record?,
           to: :work

  def initialize(work: ActionWork.new)
    @work = work

    super()

    return if work.new_record?

    self.class.attribute_names.each do |attr_name|
      public_send("#{attr_name}=", work.public_send(attr_name))
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/AbcSize
  def submit(attrs)
    work.transaction do
      assign_attributes(attrs)

      raise ActiveRecord::Rollback unless validate

      work.assign_attributes(serializable_hash)
      work.save

      sections.each do |section|
        section.destroy! if section.marked_for_destruction?
        section.save! if section.has_changes_to_save?
      end

      images.each do |image|
        image.destroy! if image.marked_for_destruction?
        image.save! if image.has_changes_to_save?
      end
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/AbcSize

  def section_attributes=(assoc_attributes)
    set_attributes_for(association: work.sections, assoc_attributes:)
  end

  def image_attributes=(assoc_attributes)
    set_attributes_for(association: work.images, assoc_attributes:)
  end

  def tags
    work.tags.map(&:name)
  end

  def submit_button_text
    "Guardar"
  end

  private

  attr_reader :work

  def attributes_with_defaults(attrs)
    self
      .class
      .attribute_names
      .map { |attr| [attr, work.public_send(attr)] }
      .to_h
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
