# frozen_string_literal: true

module HasImages
  extend ActiveSupport::Concern
  included do
    attr_accessor :images_attributes

    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images, allow_destroy: true
  end
end
