class Tag < ActiveRecord::Base
  attr_accessible :name

  before_save :name_to_underscore

  translates :name

  class Translation
    attr_accessible :locale
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

  private

  def name_to_underscore
    self.name.downcase!
  end
end
