$.fn.extend gallerify: ->
  @each ->
    $self = $(this)

    galleriaHeight= ->
      if $self.width() > 480
        return 500
      else
        return 360

    Galleria.configure

      autoplay: 7000,
      easing: 'ease-in-out',
      debug: 'false',
      height: galleriaHeight()
      lightbox: false,
      responsive: true,
      showCounter: false,
      showImagenav: false,
      showInfo: true,
      transition: 'fade',
      transitionSpeed: 600,
      touchTransition: 'slide',
      _toggleInfo: false

    Galleria.run $self

(->
  $('#galleria').gallerify()
)()
