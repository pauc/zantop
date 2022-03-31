# frozen_string_literal: true

class Work < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
