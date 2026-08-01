// Lightbox over a horizontal scroll-snap track: the browser handles touch
// swiping and momentum, so this only wires up opening, buttons and keys.

function setupGallery(gallery) {
  const dialog = gallery.querySelector("[data-gallery-dialog]")
  const track = gallery.querySelector("[data-gallery-track]")
  if (!dialog || !track) return

  const slides = Array.from(track.querySelectorAll("[data-gallery-slide]"))
  const counter = gallery.querySelector("[data-gallery-counter]")

  const currentIndex = () => {
    const width = track.clientWidth || 1
    return Math.min(slides.length - 1, Math.max(0, Math.round(track.scrollLeft / width)))
  }

  const preload = (index) => {
    for (let i = index - 1; i <= index + 1; i++) {
      const image = slides[i] && slides[i].querySelector("img")
      if (image) image.loading = "eager"
    }
  }

  const showCounter = () => {
    if (counter) counter.textContent = `${currentIndex() + 1} / ${slides.length}`
  }

  const goTo = (index, behavior) => {
    const bounded = Math.min(slides.length - 1, Math.max(0, index))
    preload(bounded)
    track.scrollTo({ left: bounded * track.clientWidth, behavior: behavior || "auto" })
    showCounter()
  }

  gallery.querySelectorAll("[data-gallery-open]").forEach((button) => {
    button.addEventListener("click", () => {
      dialog.showModal()
      goTo(Number(button.dataset.galleryOpen))
    })
  })

  const prev = gallery.querySelector("[data-gallery-prev]")
  const next = gallery.querySelector("[data-gallery-next]")
  if (prev) prev.addEventListener("click", () => goTo(currentIndex() - 1, "smooth"))
  if (next) next.addEventListener("click", () => goTo(currentIndex() + 1, "smooth"))

  const close = gallery.querySelector("[data-gallery-close]")
  if (close) close.addEventListener("click", () => dialog.close())

  // Clicks that land on the dialog itself rather than on a slide are backdrop clicks.
  dialog.addEventListener("click", (event) => {
    if (event.target === dialog || event.target === track) dialog.close()
  })

  dialog.addEventListener("keydown", (event) => {
    if (event.key === "ArrowLeft") {
      event.preventDefault()
      goTo(currentIndex() - 1, "smooth")
    } else if (event.key === "ArrowRight") {
      event.preventDefault()
      goTo(currentIndex() + 1, "smooth")
    }
  })

  track.addEventListener("scroll", showCounter, { passive: true })
}

document.querySelectorAll("[data-gallery]").forEach(setupGallery)
