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
      $self = $(this)
      url1 = $self.attr("data-resource")
      url2 = $self.attr("data-action")
      nested = $self.attr("data-sortable")
      list = $self
      data = list.sortable("serialize")
      if $self.attr("data-order") == "DESC"
        data = data.split('&').reverse().join('&')
      $.ajax
        type: "post"
        data: data
        dataType: "script"
        complete: (request) ->
          list.effect "highlight"

        url: "/ca/" + url1 + "/" + url2 + "?sortable=" + nested
