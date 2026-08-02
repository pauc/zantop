# frozen_string_literal: true

module ImagesHelper
  # Every branch is the entire content of a link to the work, so all three
  # carry the work's title: Rails 8.1 derives no alt of its own, and an image
  # with none is announced by its URL.
  def preview_image(work)
    return default_image_for_works(alt: work.title) unless (media = work.images.first)

    if media.type == "video"
      return image_tag("abustany_Movie_reel.svg",
                       class: "video unprocessed",
                       alt: work.title,
                       "data-video": media.video)
    end

    image_tag(media.image.variant(:medium), alt: work.title)
  end
end
