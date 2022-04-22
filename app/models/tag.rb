# frozen_string_literal: true

class Tag < ApplicationRecord
  include SlugConcern

  translates :name

  # extend FriendlyId
  # friendly_id :name, use: [:slugged, :simple_i18n, :history]

  has_many :works, through: :taggings, source: :taggable, source_type: "Work"
  has_many :taggings, dependent: :destroy

  # attr_accessor :name

  validates :name, presence: true

  before_save :name_to_underscore

  #scope :enabled, where("taggings_count > 0")
  def self.enabled
    select("DISTINCT(tags.id), tags.*").
    joins("JOIN taggings ON tags.id = taggings.tag_id
           JOIN works ON works.id = taggings.taggable_id
           WHERE works.published = true")
  end

  def self.tokens(query)
    unless query.blank?
      tags = Tag.with_translations(I18n.locale).order(:name).where("name ilike ?", "%#{query}%")
      if tags.empty?
        [{id: "<<<#{query}>>>", name: "new: \"#{query}\""}]
      else
        tags
      end
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { Tag.create!(name: $1).id }
    tokens.split(',')
  end

  def get_translation(locale)
    self.translations.where(locale: locale).first
  end

  def untranslated?
    self.translations.size < 3
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
      self.translations.where(locale: locale).first.try(:name)
    end
  end

  private

  def name_to_underscore
    self.name.downcase!
  end
end
