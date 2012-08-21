# == Schema Information
#
# Table name: visual_works
#
#  id               :integer         not null, primary key
#  slug_en          :string(255)
#  slug_es          :string(255)
#  slug_ca          :string(255)
#  realization_date :date
#  dimensions       :string(255)
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

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
