class Image < ActiveRecord::Base
  belongs_to :illustrated, polymorphic: true

  attr_accessible :image

  mount_uploader :image, ImageUploader
end
