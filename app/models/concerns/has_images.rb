module HasImages
  extend ActiveSupport::Concern

  included do
    attr_accessible :images_attributes

    has_many :images, as: :illustrated, dependent: :destroy
    accepts_nested_attributes_for :images,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes| attributes['image'].blank? and attributes['video'].blank? and attributes['credits'].blank? }
  end
end
