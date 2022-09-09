# frozen_string_literal: true

class Section < ApplicationRecord
  # include UserInputCleaner
  # clean_fields :body

  validates :body, presence: true

  belongs_to :work

  translates :title, :body

  # acts_as_list scope: 'content_id=#{content_id} and content_type=\'#{content_type}\''
  # default_scope :order => 'position'
end
