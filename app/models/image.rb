# == Schema Information
#
# Table name: images
#
#  id               :integer         not null, primary key
#  image            :string(255)
#  illustrated_id   :integer
#  illustrated_type :string(255)
#  position         :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Image < ActiveRecord::Base
  belongs_to :illustrated, polymorphic: true

  attr_accessible :image

  mount_uploader :image, ImageUploader

  acts_as_list scope: 'illustrated_id=#{illustrated_id} and
                       illustrated_type=\'#{illustrated_type}\''
  default_scope :order => 'position'
end
