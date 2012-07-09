class Image < ActiveRecord::Base
  belongs_to :work
  before_save :has_image?

  attr_accessible :image

  mount_uploader :image, ImageUploader

  acts_as_list scope: 'work_id=#{work_id}'
  default_scope :order => 'position'

  private 

    def has_image?
      image?
    end

end
