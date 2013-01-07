$(document).on "nested:fieldAdded", (event) ->
  event.field.parent('p').before(event.field)

$ ->
  $('.sortable_fieldset').sortable
    axis: "y"
    dropOnEmpty: false
    handle: ".handle"
    items: "div.fields"
    opacity: 0.4
    scroll: true


  $('form.with_sortable_fields').submit (event) ->
    fields = $(this).find('.fields')
    fields.each (index) ->
      $(this).find('input[id$="position"]').attr('value', index + 1)
