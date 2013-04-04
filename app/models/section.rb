class Section < ActiveRecord::Base
  include UserInputCleaner
  clean_fields :body

  attr_accessible :title, :body

  validate :body_not_blank

  belongs_to :content, polymorphic: true

  translates :title, :body

  acts_as_list scope: 'content_id=#{content_id} and
                       content_type=\'#{content_type}\''
  default_scope :order => 'position'

  def body_not_blank
    body.present?
  end
end
