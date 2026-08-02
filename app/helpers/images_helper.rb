# frozen_string_literal: true

module ImagesHelper
  # Every branch is the entire content of a link to the work, so all three
  # carry the work's title: Rails 8.1 derives no alt of its own, and an image
  # with none is announced by its URL.
  def preview_image(work)
    return default_image_for_works(alt: work.title) unless (media = work.images.first)

    # The same stand-in the gallery uses for a video, for the same reason: a
    # video is a URL we hold no file of, so there is no frame of it to show.
    # The gallery's copy is aria-hidden because the button around it is named;
    # this one is the whole content of the link, so it has to carry the name
    # itself — which is what role="img" is for, the glyph being its picture.
    if media.type == "video"
      return tag.span("▶", class: "work-preview-video",
                           role: "img",
                           aria: { label: work.title })
    end

    image_tag(media.image.variant(:medium), alt: work.title)
  end
end
