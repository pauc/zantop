class Image < ActiveRecord::Base
  belongs_to :work

  attr_accessible :image

  mount_uploader :image, ImageUploader

  acts_as_list scope: 'work_id=#{work_id}'
  default_scope :order => 'position'
end
