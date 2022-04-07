# frozen_string_literal: true

class Image < ApplicationRecord
  # include UserInputCleaner

  # clean_fields :credits

  belongs_to :work

  attr_accessor :image, :video, :credits, :image_cache

  translates :credits

  # mount_uploader :image, ImageUploader

  validate :image_xor_video

  # acts_as_list scope: 'illustrated_id=#{illustrated_id} and
  #                      illustrated_type=\'#{illustrated_type}\''
  # default_scope :order => 'position'

  def type
    return "image" if image.present?
    return "video" if video.present?
  end

  private

  def image_xor_video
    if image.present? and video.present?
      errors.add(:image, "Només imatge o video, no tots dos")
      errors.add(:video, "Només imatge o video, no tots dos")
      return false
    end

    if image.blank? and video.blank?
      errors.add(:image, "Has d'indicar una imatge o vídeo")
      errors.add(:video, "Has d'indicar una imatge o vídeo")
      false
    end
  end
end
