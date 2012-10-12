class Image < ActiveRecord::Base
  belongs_to :illustrated, polymorphic: true

  attr_accessible :image

  mount_uploader :image, ImageUploader

  acts_as_list scope: 'illustrated_id=#{illustrated_id} and
                       illustrated_type=\'#{illustrated_type}\''
  default_scope :order => 'position'
end
