# frozen_string_literal: true

class Work < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sections, dependent: :destroy
  has_many :images, dependent: :destroy

  translates :title, :description, :techniques, :place
end
