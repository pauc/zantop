# frozen_string_literal: true

module ImagesHelper
  def preview_image(work)
    return default_image_for_works unless (media = work.images.first)

    if media.type == "video"
      return image_tag("abustany_Movie_reel.svg",
                       class: "video unprocessed",
                       "data-video": media.video)
    end

    image_tag(media.image.variant(:medium))
  end
end
