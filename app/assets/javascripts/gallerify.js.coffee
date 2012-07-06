Galleria.configure
  transition: 'pulse',
  lightbox: true,
  overlayBackground: '#e0e0e0',
  transitionSpeed: 400,
  showCounter: false,
  responsive: true,
  easing: 'swing',
  autoplay: 7000,
  showInfo: false

$ ->
  if $('#galleria').length > 0
    Galleria.run('#galleria')
