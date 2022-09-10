# frozen_string_literal: true

class Image < ApplicationRecord
  include HasTranslations

  translates :credits

  belongs_to :work

  validate :image_xor_video

  has_one_attached :image do |attachable|
    attachable.variant :thumb,  resize_to_fit:  [100, 100]
    attachable.variant :medium, resize_to_fill: [400, 400]
  end

  # acts_as_list scope: 'illustrated_id=#{illustrated_id} and
  #                      illustrated_type=\'#{illustrated_type}\''
  # default_scope :order => 'position'

  def type
    return "image" if image.present?
    return "video" if video.present?
  end

  private

  def image_xor_video
    if image.present? && video.present?
      errors.add(:image, "Només imatge o video, no tots dos")
      errors.add(:video, "Només imatge o video, no tots dos")
    end

    if image.blank? && video.blank?
      errors.add(:image, "Has d'indicar una imatge o vídeo")
      errors.add(:video, "Has d'indicar una imatge o vídeo")
    end
  end
end
