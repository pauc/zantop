galleria_height= ->
  galleria = $('#galleria')
  if galleria.width() > 480
    return 500
  else
    return 360

Galleria.configure
  autoplay: 7000,
  easing: 'ease-in-out',
  debug: 'false',
  height: galleria_height()
  lightbox: false,
  responsive: true,
  showCounter: false,
  showImagenav: false,
  showInfo: true,
  transition: 'fade',
  transitionSpeed: 600,
  touchTransition: 'slide',
  _toggleInfo: false

$ ->
  if $('#galleria').length > 0
    Galleria.run('#galleria')
