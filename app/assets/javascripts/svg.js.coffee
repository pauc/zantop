$ ->
  if !Modernizr.svg
    $('img[data-svg_fallback]').attr 'src', (index, attr) ->
      return $(this).attr('data-svg_fallback')
