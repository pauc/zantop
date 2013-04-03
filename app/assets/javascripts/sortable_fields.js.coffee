$(document).on "nested:fieldAdded", (event) ->
  event.field.parent('p').before(event.field)
  textArea = event.field.find('.rich-text-area')
  init_CKEditor textArea.attr('id')

 ## CKEDITOR for image credits-&-comments
init_CKEditor = (textAreaId) ->
  CKEDITOR.replace textAreaId,
    height: "5em"

$ ->
  ## Replace textareas with CKEditor
  text_areas = $('.rich-text-area')
  $.each text_areas, (i) ->
    init_CKEditor text_areas[i].id

  ## Make fields sortable
  $('.sortable_fieldset').sortable
    axis: "y"
    dropOnEmpty: false
    handle: ".handle"
    items: "div.fields"
    opacity: 0.4
    scroll: true


  ## Set the field position on submit
  $('form.with_sortable_fields').submit (event) ->
    fields = $(this).find('.fields')
    fields.each (index) ->
      $(this).find('input[id$="position"]').attr('value', index + 1)
