//= require jquery.ui.sortable
//= require jquery.effects.highlight

$ ->
  $(".sortable-list").sortable
    axis: "y"
    dropOnEmpty: false
    handle: ".handle"
    cursor: "crosshair"
    items: "li"
    opacity: 0.4
    scroll: true
    update: ->
      url1 = $(this).attr("data-resource")
      url2 = $(this).attr("data-action")
      nested = $(this).attr("data-sortable")
      list = $(this)
      $.ajax
        type: "post"
        data: list.sortable("serialize")
        dataType: "script"
        complete: (request) ->
          list.effect "highlight"

        url: "/ca/" + url1 + "/" + url2 + "?sortable=" + nested
