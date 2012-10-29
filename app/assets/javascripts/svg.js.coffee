$ ->
  if !Modernizr.svg
    $('img').attr 'src', (index, attr) ->
      attr.replace '.svg', '.png'
