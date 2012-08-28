# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Page < ActiveRecord::Base
  translates :title, :body

  attr_accessible :body, :title
  
  class Translation
    attr_accessible :locale
  end

  include UserInputCleaner

  validates :title, presence: true
  validates :body, presence: true

  def self.about
    find(1)
  end

  def self.contact
    find(2)
  end
end
