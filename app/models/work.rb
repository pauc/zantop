# frozen_string_literal: true

class Work < ApplicationRecord
  include HasImages

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  include HasImages

  translates :title, :description, :techniques, :place

  validates :title, presence: true

  scope :published, -> { where(published: true) }

  def first_image
    images.where.not(image: nil).first.try(:image).try(:medium)
  end
end
