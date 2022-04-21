# frozen_string_literal: true

class Work < ApplicationRecord
  include HasImages
  include SlugConcern

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  translates :title, :description, :techniques, :place

  validates :title, presence: true

  scope :published, -> { where(published: true) }

  def first_image
    images.where.not(image: nil).first.try(:image).try(:medium)
  end

  def related
    conditions_array_for_taggings = [self.tags.map { |t| "tag_id = ?" }
                                     .join(" OR ")]
    self.tags.each { |t| conditions_array_for_taggings << t.id }
    work_ids_from_taggings = Tagging.select("DISTINCT taggable_id").
      where(conditions_array_for_taggings).
      where("taggable_id != ?", self.id)
    self.class.published.where(id: work_ids_from_taggings).limit(5).
      includes(:translations)
  end
end
