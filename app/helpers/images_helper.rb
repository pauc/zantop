# frozen_string_literal: true

module ImagesHelper
  def preview_image(work)
    media = work.images.first
    if media.present? && media.type == "image"
      image_tag media.image.medium
    elsif media.present? && media.type == "video"
      image_tag("abustany_Movie_reel.svg", class: "video unprocessed",
                                           "data-video": media.video)
    else
      default_image_for_works
    end
  end
end
