class Post < ActiveRecord::Base
  translates :title, :text
  attr_accessible :title, :text

  include Slugconcern

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n]

  class Translation
    attr_accessible :locale
  end

  validates :title, presence: true

end
