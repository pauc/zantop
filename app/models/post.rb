# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  slug_en    :string(255)
#  slug_es    :string(255)
#  slug_ca    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Post < ActiveRecord::Base
  translates :title, :text
  attr_accessible :title, :text

  include Slugconcern
  include UserInputCleaner

  clean_fields :text

  extend FriendlyId
  friendly_id :title, use: [:slugged, :simple_i18n]

  class Translation
    attr_accessible :locale
  end

  validates :title, presence: true

end
