class Tag < ActiveRecord::Base
  attr_accessible :name

  translates :name

  class Translation
    attr_accessible :locale
  end

  validates :name, presence: true

  has_many :visual_works, through: :taggings, source: :taggable, source_type: "VisualWork"
  has_many :action_works, through: :taggings, source: :taggable, source_type: "ActionWork"
  has_many :taggings

  def taggables
    [visual_works + action_works].flatten
  end

end
