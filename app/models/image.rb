class Image < ActiveRecord::Base
  belongs_to :illustrated, polymorphic: true, dependent: :destroy

  attr_accessible :image

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
