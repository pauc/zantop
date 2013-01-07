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
      data = list.sortable("serialize")
      if $(this).attr("data-order") == "DESC"
        data = data.split('&').reverse().join('&')
      $.ajax
        type: "post"
        data: data
        dataType: "script"
        complete: (request) ->
          list.effect "highlight"

        url: "/ca/" + url1 + "/" + url2 + "?sortable=" + nested
