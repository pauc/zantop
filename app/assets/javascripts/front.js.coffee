jQuery ->
  if $('#pagination').length
    $('.new-work').removeClass('new-work')
    pagination = $('#pagination')
    alt_text = pagination.data('alt_text')
    opts = opts = offset: '100%'

    pagination.waypoint ((event, direction) ->
      pagination.waypoint('remove')
      url = $('.pagination .next_page').attr('href')
      if url
        pagination.html(alt_text)
        $.getScript url , ->
          $('.new-work').css({display: 'none', visibility: 'visible'}).fadeIn 600, "linear", ->
            $(this).removeClass('new-work')
            pagination.waypoint(opts)
    ),
      opts
