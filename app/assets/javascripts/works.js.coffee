processURL = (url, success) ->
  processYouTube = (id) ->
    throw new Error("Unsupported YouTube URL")  unless id
    success "http://i2.ytimg.com/vi/" + id + "/hqdefault.jpg"
  id = undefined
  if url.indexOf("youtube.com") > -1
    id = url.split("/")[1].split("v=")[1].split("&")[0]
    return processYouTube(id)
  else if url.indexOf("youtu.be") > -1
    id = url.split("/")[1]
    return processYouTube(id)
  else if url.indexOf("vimeo.com") > -1
    if url.match(/^vimeo.com\/[0-9]+/)
      id = url.split("/")[1]
    else if url.match(/^vimeo.com\/channels\/[\d\w]+#[0-9]+/)
      id = url.split("#")[1]
    else if url.match(/vimeo.com\/groups\/[\d\w]+\/videos\/[0-9]+/)
      id = url.split("/")[4]
    else
      throw new Error("Unsupported Vimeo URL: " + url)
    $.ajax
      url: "http://vimeo.com/api/v2/video/" + id + ".json"
      dataType: "jsonp"
      success: (data) ->
        success(data[0].thumbnail_large)

  else
    throw new Error("Unrecognised URL")

$ ->
  $('.work-preview img.video').each ->
    image = $(this)
    video_url = image.data("video").replace('http://', "")
    processURL video_url, (new_url) ->
      image.attr "src", new_url
      parent_height = image.parents('div').first().height()
      image.one('load', ->
        image.css('top', (parent_height - image.height()) / 2 / parent_height * 100 + "%")
      ).each ->
        $(this).load() if $(this).complete || $(this).height == 0
