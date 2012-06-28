class Page < ActiveRecord::Base
  attr_accessible :body, :position, :slug, :title

  def self.about
    find(1)
  end

  def self.contact
    find(2)
  end
end
