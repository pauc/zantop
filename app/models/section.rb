# frozen_string_literal: true

class Section < ApplicationRecord
  translates :title, :body

  has_rich_text :body

  belongs_to :work

  validates :body, presence: true

  # acts_as_list scope: 'content_id=#{content_id} and content_type=\'#{content_type}\''
  # default_scope :order => 'position'
end
