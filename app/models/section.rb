# frozen_string_literal: true

class Section < ApplicationRecord
  # include UserInputCleaner
  # clean_fields :body

  attr_accessor :title, :body

  validate :body_not_blank

  belongs_to :work

  translates :title, :body

  # acts_as_list scope: 'content_id=#{content_id} and content_type=\'#{content_type}\''
  # default_scope :order => 'position'

  private

  def body_not_blank
    body.present?
  end
end
