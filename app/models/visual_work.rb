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
  include HasImages
  include Slugconcern
  include UserInputCleaner
  include HasTags

  translates :title, :description, :techniques
  clean_fields :description

  class Translation
    attr_accessible :locale
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n, :history]

  attr_accessible :title,
                  :description,
                  :realization_date,
                  :techniques,
                  :dimensions,
                  :position

  validates :title, presence: true
end
