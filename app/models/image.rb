#encoding: UTF-8
class Image < ActiveRecord::Base
  include UserInputCleaner

  clean_fields :credits

  belongs_to :illustrated, polymorphic: true, counter_cache: true

  attr_accessible :image, :video, :credits, :image_cache

  translates :credits

  mount_uploader :image, ImageUploader

  validate :image_xor_video

  acts_as_list scope: 'illustrated_id=#{illustrated_id} and
                       illustrated_type=\'#{illustrated_type}\''
  default_scope :order => 'position'

  def type
    return "image" if self.image.present?
    return "video" if self.video.present?
  end

  private

  def image_xor_video
    if !self.image.blank? and !self.video.blank?
      errors.add(:image, "Només imatge o video, no tots dos")
      errors.add(:video, "Només imatge o video, no tots dos")
      return false
    end

    if self.image.blank? and self.video.blank?
      errors.add(:image, "Has d'indicar una imatge o vídeo")
      errors.add(:video, "Has d'indicar una imatge o vídeo")
      return false
    end
  end
end
