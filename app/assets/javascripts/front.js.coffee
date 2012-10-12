jQuery ->
  if $('.pagination').length
    alt_text = $('.pagination').data('alt_text')
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text(alt_text)
        $.getScript(url)
    $(window).scroll()
