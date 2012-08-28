class Tag < ActiveRecord::Base
  attr_accessible :name
  
  before_save :name_to_underscore

  translates :name

  class Translation
    attr_accessible :locale
  end

  validates :name, presence: true

  has_many :visual_works, through: :taggings, source: :taggable, source_type: "VisualWork"
  has_many :action_works, through: :taggings, source: :taggable, source_type: "ActionWork"
  has_many :taggings

  def self.tokens(query)
    tags = Tag.with_translations(I18n.locale).order(:name).where("name ilike ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", name: "new: \"#{query}\""}]
    else
      tags
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
