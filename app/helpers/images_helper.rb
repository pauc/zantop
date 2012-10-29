module ImagesHelper
  def preview_image(work)
    media = work.images.first
    if media.present? and media.type == "image"
      return image_tag media.image.medium
    elsif media.present? and media.type == "video"
      return image_tag("abustany_Movie_reel.svg", class: "video", :"data-video" => media.video)
    else
      return image_tag "mz-comodin.png"
    end
  end
end
