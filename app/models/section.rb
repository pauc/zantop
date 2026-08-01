# frozen_string_literal: true

class Section < ApplicationRecord
  include HasTranslations

  translates :title, plain: true
  translates :body

  belongs_to :work

  validates :body, presence: true
end
