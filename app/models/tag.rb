# frozen_string_literal: true

class Tag < ApplicationRecord
  include HasSlugs
  include HasTranslations

  friendly_id :name, use: [:slugged, :simple_i18n, :history]

  translates :name, plain: true

  has_many :taggings, dependent: :destroy
  has_many :works, through: :taggings, source: :work

  # attr_accessor :name

  validates :name, presence: true

  before_save :name_to_underscore

  scope :enabled, -> { distinct.joins(:works).merge(Work.published) }

  def untranslated?
    plain_text_translations.size < 3
  end

  private

  def name_to_underscore
    name.downcase!
  end
end
