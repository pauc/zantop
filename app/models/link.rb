class Link < ActiveRecord::Base
  attr_accessible :title, :url

  before_save :create_title_if_not_present

  validates :url, presence: true

  acts_as_list

  private

  def create_title_if_not_present
    self.title = self.url.split("://")[1] if self.title.blank?
  end
end
