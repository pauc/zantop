# frozen_string_literal: true

class Work < ApplicationRecord
  include HasImages
  include HasSections
  include HasSlugs
  include HasTranslations

  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  translates :title, :description, :techniques, :place

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :title, presence: true

  scope :published, -> { where(published: true) }

  def first_image
    images.with_attached_image.first&.image&.variant(:medium)
  end

  def related
    conditions_array_for_taggings = [tags.map { |_t| "tag_id = ?" }
                                         .join(" OR ")]
    tags.each { |t| conditions_array_for_taggings << t.id }
    work_ids_from_taggings = Tagging.select("DISTINCT work_id")
                                    .where(conditions_array_for_taggings)
                                    .where.not(work_id: id)
    self.class.published.where(id: work_ids_from_taggings).limit(5)
        .includes(:translations)
  end
end
