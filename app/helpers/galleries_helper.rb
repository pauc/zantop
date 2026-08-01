# frozen_string_literal: true

module GalleriesHelper
  # Intrinsic size of a `resize_to_fit` variant, so the browser can reserve the
  # right box before the image loads. Sources are capped at 1200px, so a variant
  # limit above that never scales up.
  def variant_dimensions(image, limit)
    metadata = image.image.blob.metadata
    width = metadata["width"]
    height = metadata["height"]
    return [nil, nil] unless width && height

    scale = [limit.to_f / width, limit.to_f / height, 1.0].min
    [(width * scale).round, (height * scale).round]
  end

  def gallery_images(work)
    work.images.includes(:rich_text_translations)
  end
end
