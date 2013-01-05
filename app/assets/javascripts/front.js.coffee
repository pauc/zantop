changePagination = (pagination) ->
  alt_text = pagination.data('alt_text')
  url = pagination.find('a.next_page').attr('href')
  pagination.html "<a id='ajx_get_works' href='" + url + "'>" + alt_text + "</a>"
  url


jQuery ->
  if $('#pagination').length
    $('.new-work').removeClass('new-work')
    pagination = $('#pagination')
    url = changePagination pagination

    $('#ajx_get_works').live "click", (event) ->
      event.preventDefault()
      $.getScript url, ->
        url = changePagination pagination
        $('.new-work').css({display: 'none', visibility: 'visible'}).fadeIn 600, "linear", ->
          $(this).removeClass('new-work')
