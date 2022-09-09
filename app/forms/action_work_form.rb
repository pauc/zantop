# frozen_string_literal: true

class ActionWorkForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Serialization

  attribute :title, :string
  attribute :description, :string
  attribute :place, :string
  attribute :realization_date, :date
  attribute :published, :boolean

  validates :title, presence: true

  delegate :sections, :images, to: :work

  def initialize(work: ActionWork.new, **attrs)
    @work = work

    work
      .serializable_hash(only: self.class.attribute_names)
      .then(&attrs.method(:with_defaults))
      .then { |attrs_with_defaults| super(attrs_with_defaults) }
  end

  def submit
    return unless validate

    work.transaction do
      work.assign_attributes(serializable_hash)
      work.save

      sections.each do |section|
        section.save if section.has_changes_to_save?
      end

      images.each do |image|
        image.save if image.has_changes_to_save
      end
    end
  end

  def section_attributes=(attributes)
    set_attributes_for(association: work.sections, attributes:)
  end

  def image_attributes=(attributes)
    set_attributes_for(association: work.images, attributes:)
  end

  def submit_button_text
    return "Crear treball d'acció" if work.new_record?

    "Actualitzar treball d'acció"
  end

  private

  attr_reader :work

  def set_attributes_for(association:, attributes:)
    attributes.each do |id, attrs|
      id = Integer(id)

      if id > 999_999_999_999_000
        association.build(attrs)

        next
      end

      association
        .find { |section| section.id == id }
        .assign_attributes(attrs)
    end
  end
end
