class VisualWork < ActiveRecord::Base
  translates :title, :description, :techniques

  attr_accessible :title,
                  :description,
                  :realization_date,
                  :techniques,
                  :dimensions,
                  :position,
                  :images_attributes

  class Translation
    attr_accessible :locale
  end

  validates :title, presence: true

  include Slugconcern
  include UserInputCleaner

  clean_fields :description

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  has_many :images, as: :illustrated, dependent: :destroy
  accepts_nested_attributes_for :images,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['image'].blank? }
end
