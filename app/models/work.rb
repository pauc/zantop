# frozen_string_literal: true

class Work < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  include HasImages

  translates :title, :description, :techniques, :place

  validates :title, presence: true

  # scope :published, -> { where(published: true) }
  def first_image
    self.images.where('image is not null').first.try(:image).try(:medium)
  end
end
