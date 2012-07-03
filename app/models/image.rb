class Image < ActiveRecord::Base
  belongs_to :illustrated, polymorphic: true, dependent: :destroy

  validates :image, presence: true
end
