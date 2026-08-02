# frozen_string_literal: true

class Image < ApplicationRecord
  include HasTranslations

  # Plain, not rich: credits are a photo credit or a few lines of a poem shown
  # in a <figcaption>. They need literal line breaks and nothing else, and a
  # work with twenty images would otherwise build twenty Trix editors to collect
  # them. See "Rich text" in CLAUDE.md.
  translates :credits, plain: true

  # `touch` for the same reason as `Section`: the gallery is rendered inside a
  # fragment cached on the work. It covers the file as well as the columns,
  # because an `ActiveStorage::Attachment` touches the record it hangs off
  # (`ActiveStorage.touch_attachment_records`), so attaching, replacing or
  # purging an image lands here and carries on to the work.
  belongs_to :work, touch: true

  validate :image_xor_video

  has_one_attached :image do |attachable|
    attachable.variant :thumb,  resize_to_fit:  [100, 100]
    attachable.variant :medium, resize_to_fill: [400, 400]
    attachable.variant :card,   resize_to_fit:  [500, 500]
    attachable.variant :large,  resize_to_fit:  [1000, 1000]
    attachable.variant :full,   resize_to_fit:  [2000, 2000]
  end

  # Browsers submit a textarea's value with CRLF line endings, so credits typed
  # into the form would otherwise be stored with a line ending the rows migrated
  # out of rich text do not have. Trix used to hide this by normalising the
  # newlines itself; a plain textarea does not.
  def credits=(value)
    super(value.is_a?(String) ? value.gsub(/\r\n?/, "\n") : value)
  end

  def type
    return "image" if image.present?

    "video" if video.present?
  end

  private

  def image_xor_video
    if image.present? && video.present?
      errors.add(:image, "Només imatge o video, no tots dos")
      errors.add(:video, "Només imatge o video, no tots dos")
    end

    return unless image.blank? && video.blank?

    errors.add(:image, "Has d'indicar una imatge o vídeo")
    errors.add(:video, "Has d'indicar una imatge o vídeo")
  end
end
