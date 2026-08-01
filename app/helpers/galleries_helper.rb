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

  # Ordered by position and loaded eagerly: `images` has no default order, and
  # a relation would answer `first` with its own `ORDER BY id LIMIT 1` while
  # `drop(1)` dropped whatever the unordered scan happened to return first.
  def gallery_images(work)
    work.images.order(:position, :id).includes(:rich_text_translations).to_a
  end
end
