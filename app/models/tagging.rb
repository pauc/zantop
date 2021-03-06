class Tagging < ActiveRecord::Base
  attr_accessible :tag_id, :taggable_id, :taggable_type

  belongs_to :tag, counter_cache: true, touch: true
  belongs_to :taggable, polymorphic: true, touch: true

  [:tag_id, :taggable_id, :taggable_type].each do |field|
    validates field, presence: true
  end
end
