(->
  class VideoProcessor
    constructor: (@videoUrl, @success) ->

    processYoutube: (id) ->
      throw new Error('Unsupported Youtube URL') unless id
      @success "http://i2.ytimg.com/vi/" + id + "/hqdefault.jpg"

    getNewImage: ->
      id = undefined

      callbackFunc = @success

      if @videoUrl.indexOf("youtube.com") > -1
        id = @videoUrl.split("/")[1].split("v=")[1].split("&")[0]
        return @.processYoutube(id)
      else if @videoUrl.indexOf("youtu.be") > -1
        id = @videoUrl.split("/")[1]
        return @.processYoutube(id)
      else if @videoUrl.indexOf("vimeo.com") > -1
        if @videoUrl.match(/^vimeo.com\/[0-9]+/)
          id = @videoUrl.split("/")[1]
        else if @videoUrl.match(/^vimeo.com\/channels\/[\d\w]+#[0-9]+/)
          id = @videoUrl.split("#")[1]
        else if @videoUrl.match(/vimeo.com\/groups\/[\d\w]+\/videos\/[0-9]+/)
          id = @videoUrl.split("/")[4]
        else
          throw new SyntaxError("Unsupported Vimeo URL: " + @videoUrl)
        $.ajax
          url: "http://vimeo.com/api/v2/video/" + id + ".json"
          dataType: "jsonp"
          success: (data) ->
            callbackFunc(data[0].thumbnail_large)

  $.fn.extend processVideoURL: ->
    @each ->
      image = $(this)
      videoUrl = image.data('video').split("://")[1]

      videoProcessor = new VideoProcessor videoUrl, (new_url) ->
        image.attr "src", new_url
        parent_height = image.parents('div').first().height()
        image.one('load', ->
          image.css('top', (parent_height - image.height()) / 2 / parent_height * 100 + "%")
        ).each ->
          $(this).load() if $(this).complete || $(this).height == 0

      videoProcessor.getNewImage()
      image.removeClass 'unprocessed'

  $.fn.extend replace_pagination: ->
    @each ->
      $self = $(this)

      changePagination =  ->
        alt_text = $self.data('alt_text')
        url = $self.find('a.next_page').attr('href')
        $self.html "<a id='ajx_get_works' href='" + url + "'>" + alt_text + "</a>" if url
        url

      url = changePagination $self

      fetch_and_show_works = (event) ->
        event.preventDefault()
        $.getScript url, ->
          url = changePagination $self
          $('.new-work img.video.unprocessed').processVideoURL()
          $('.new-work').css({display: 'none', visibility: 'visible'}).fadeIn 600, "linear", ->
            $(this).removeClass('new-work')

      $('.new-work').removeClass('new-work')

      $self.on 'click', '#ajx_get_works', fetch_and_show_works

  $('#pagination').replace_pagination()
  $('.work-preview img.video.unprocessed').processVideoURL()
)()
