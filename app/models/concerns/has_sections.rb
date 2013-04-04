module HasSections
  extend ActiveSupport::Concern

  included do
    attr_accessible :sections_attributes

    has_many :sections, as: :content, dependent: :destroy

    accepts_nested_attributes_for :sections, allow_destroy: true,
      reject_if: proc { |params| params[:body].blank? }
  end
end
