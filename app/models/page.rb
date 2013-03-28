class Page < ActiveRecord::Base
  translates :title, :body

  attr_accessible :body, :title

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
