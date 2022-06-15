# frozen_string_literal: true

class Tag < ApplicationRecord
  include HasSlugs

  friendly_id :name, use: [:slugged, :simple_i18n, :history]

  translates :name

  has_many :taggings, dependent: :destroy
  has_many :works, through: :taggings, source: :work

  # attr_accessor :name

  validates :name, presence: true

  before_save :name_to_underscore

  # scope :enabled, where("taggings_count > 0")
  def self.enabled
    select("DISTINCT(tags.id), tags.*")
      .joins("JOIN taggings ON tags.id = taggings.tag_id
           JOIN works ON works.id = taggings.work_id
           WHERE works.published = true")
  end

  def self.tokens(query)
    return unless query

    tags = Tag.with_translations(I18n.locale).order(:name).where("name ilike ?", "%#{query}%")
    if tags.empty?
      [{ id: "<<<#{query}>>>", name: "new: \"#{query}\"" }]
    else
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { Tag.create!(name: Regexp.last_match(1)).id }
    tokens.split(",")
  end

  def get_translation(locale)
    translations.find_by(locale:)
  end

  def untranslated?
    translations.size < 3
  end

  def self.all_translated?
    translated = true
    all.take_while do |tag|
      translated = tag.translations.size == 3
    end
    translated
  end

  I18n.available_locales.each do |locale|
    define_method "name_#{locale}" do
      translations.find_by(locale:).try(:name)
    end
  end

  private

  def name_to_underscore
    name.downcase!
  end
end
