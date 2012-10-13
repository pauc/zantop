class Work < ActiveRecord::Base
  include HasImages
  include SlugConcern
  include UserInputCleaner
  include HasTags

  acts_as_list

  translates :title, :description, :techniques, :place
  clean_fields :description

  class Translation
    attr_accessible :locale
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  attr_accessible :title,
                  :description,
                  :place,
                  :realization_date,
                  :techniques,
                  :dimensions,
                  :position,
                  :published

  validates :title, presence: true

  default_scope order: 'position DESC'
  scope :published, where(published: true)
end
