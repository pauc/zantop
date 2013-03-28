$.fn.extend image_cache_src: ->
  @each ->
    self = $(this)
    if self.attr("src").indexOf("uploads/tmp/")
      new_src = self.attr("src").replace(/http:\/\/.+\/uploads\/tmp\//, "/uploads/tmp/")
      self.attr "src", new_src

$ ->
  $('fieldset').on 'change', "input[type='file']", ->
    thumb_container = $(this).closest('div.control-group').siblings('.image-preview')
    img_tag = $("<img />")
    file = @files[0]
    reader = new FileReader()
    reader.onload = (event) ->
      img_tag.attr "src", event.target.result
      thumb_container.html img_tag

    reader.readAsDataURL file

  $('.image-preview img').image_cache_src()

