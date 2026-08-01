# frozen_string_literal: true

class Work < ApplicationRecord
  include HasSlugs
  include HasTranslations

  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  translates :title, :techniques, :place, plain: true
  translates :description

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :title, presence: true

  scope :published, -> { where(published: true) }

  def first_image
    images
      .with_attached_image
      .find { |image| image.image.attached? }
      &.image
      &.variant(:medium)
  end

  def related
    work_ids_from_taggings = Tagging.select("DISTINCT work_id")
                                    .where(tag_id: tag_ids)
                                    .where.not(work_id: id)
    self
      .class
      .published
      .where(id: work_ids_from_taggings)
      .limit(5)
      .includes(:plain_text_translations)
  end
end
