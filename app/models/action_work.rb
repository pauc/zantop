# == Schema Information
#
# Table name: action_works
#
#  id               :integer         not null, primary key
#  slug_en          :string(255)
#  slug_es          :string(255)
#  slug_ca          :string(255)
#  realization_date :date
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class ActionWork < ActiveRecord::Base
  include HasImages
  include Slugconcern
  include UserInputCleaner
  include HasTags

  translates :title, :description, :place
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
                  :position

  validates :title, presence: true
end
