class Page < ActiveRecord::Base
  attr_accessible :body, :slug, :title

  validates :title, presence: true

  def self.about
    find(1)
  end

  def self.contact
    find(2)
  end
end
