# frozen_string_literal: true

class Section < ApplicationRecord
  include HasTranslations

  translates :title, plain: true
  translates :body

  belongs_to :work

  validates :body, presence: true

  # acts_as_list scope: 'content_id=#{content_id} and content_type=\'#{content_type}\''
  # default_scope :order => 'position'
end
