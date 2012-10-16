class Tag < ActiveRecord::Base
  attr_accessible :name

  before_save :name_to_underscore

  translates :name

  class Translation
    attr_accessible :locale
    attr_accessible :name
  end

  validates :name, presence: true

  has_many :works, through: :taggings, source: :taggable, source_type: "Work"
  has_many :taggings, dependent: :destroy

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

  I18n.available_locales.each do |locale|
    define_method "name_#{locale}" do
      self.translations.where(locale: locale).first.try(:name)
    end

    define_method "name_#{locale}=" do |name|
      trl = self.translations.where(locale: locale).first
      if trl.present?
        trl.name = name.downcase
        trl.save
      else
        self.translations.create(name: name.downcase, locale: locale)
      end
    end
  end

  private

  def name_to_underscore
    self.name.downcase!
  end
end
