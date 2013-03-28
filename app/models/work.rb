class Work < ActiveRecord::Base
  include HasImages
  include SlugConcern
  include UserInputCleaner
  include HasTags

  acts_as_list

  translates :title, :description, :techniques, :place
  clean_fields :description

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

  def first_image
    self.images.where("image is not null").first.try(:image).try(:medium)
  end
end
