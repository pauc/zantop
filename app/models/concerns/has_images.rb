module HasImages
  extend ActiveSupport::Concern

  included do
    attr_accessible :images_attributes

    has_many :images, as: :illustrated, dependent: :destroy
    accepts_nested_attributes_for :images,
                                  allow_destroy: true
  end
end
