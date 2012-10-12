class Post < ActiveRecord::Base
  translates :title, :text
  attr_accessible :title, :text, :position

  include SlugConcern
  include UserInputCleaner

  clean_fields :text

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n]

  class Translation
    attr_accessible :locale
  end

  validates :title, presence: true

  acts_as_list
  default_scope :order => 'position'

end
