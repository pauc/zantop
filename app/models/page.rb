# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  body       :text
#  slug       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

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
