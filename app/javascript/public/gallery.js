// Two scroll-snap tracks — the lead on the page and the lightbox — each paired
// with a strip of thumbnails that marks where you are. The browser handles the
// swiping, momentum and snapping; this only keeps the marks in step.

// Which slide a snap track is currently resting on, and how to move it.
function snapTrack(track, slideSelector) {
  const slides = Array.from(track.querySelectorAll(slideSelector))

  const index = () => {
    const width = track.clientWidth || 1
    return Math.min(slides.length - 1, Math.max(0, Math.round(track.scrollLeft / width)))
  }

  const goTo = (to, behavior) => {
    const bounded = Math.min(slides.length - 1, Math.max(0, to))
    track.scrollTo({ left: bounded * track.clientWidth, behavior: behavior || "auto" })
  }

  return { slides, index, goTo }
}

// Centres a thumbnail in its own strip by moving that strip's scroll.
//
// Not `scrollIntoView`: on the page strip, which wraps rather than scrolls and
// so has nothing of its own to move, it walked up to the document instead and
// yanked the whole page down to the thumbnails the moment the page loaded.
function centreInStrip(strip, button) {
  if (!strip || strip.scrollWidth <= strip.clientWidth) return

  const offset = button.getBoundingClientRect().left - strip.getBoundingClientRect().left
  const centred = strip.scrollLeft + offset - (strip.clientWidth - button.offsetWidth) / 2
  strip.scrollTo({ left: centred, behavior: "smooth" })
}

// Marks one thumbnail as current and keeps it in view when the strip scrolls.
function markStrip(strip, buttons, current) {
  buttons.forEach((button, i) => {
    const isCurrent = i === current
    button.classList.toggle("is-current", isCurrent)
    if (isCurrent) {
      button.setAttribute("aria-current", "true")
    } else {
      button.removeAttribute("aria-current")
    }
  })

  if (buttons[current]) centreInStrip(strip, buttons[current])
}

function setupGallery(gallery) {
  const leadTrack = gallery.querySelector("[data-gallery-lead-track]")
  if (!leadTrack) return

  const lead = snapTrack(leadTrack, "[data-gallery-lead]")
  const strip = gallery.querySelector("[data-gallery-strip]")
  const stripButtons = Array.from(gallery.querySelectorAll("[data-gallery-select]"))

  const refreshLead = () => markStrip(strip, stripButtons, lead.index())

  stripButtons.forEach((button) => {
    button.addEventListener("click", () => lead.goTo(Number(button.dataset.gallerySelect), "smooth"))
  })

  leadTrack.addEventListener("scroll", refreshLead, { passive: true })
  leadTrack.addEventListener("keydown", (event) => {
    if (event.key === "ArrowLeft") {
      event.preventDefault()
      lead.goTo(lead.index() - 1, "smooth")
    } else if (event.key === "ArrowRight") {
      event.preventDefault()
      lead.goTo(lead.index() + 1, "smooth")
    }
  })
  refreshLead()

  const dialog = gallery.querySelector("[data-gallery-dialog]")
  const track = gallery.querySelector("[data-gallery-track]")
  if (!dialog || !track) return

  const slides = snapTrack(track, "[data-gallery-slide]")
  const filmstrip = gallery.querySelector("[data-gallery-filmstrip]")
  const filmButtons = Array.from(gallery.querySelectorAll("[data-gallery-jump]"))
  const counter = gallery.querySelector("[data-gallery-counter]")
  const prev = gallery.querySelector("[data-gallery-prev]")
  const next = gallery.querySelector("[data-gallery-next]")

  const preload = (index) => {
    for (let i = index - 1; i <= index + 1; i++) {
      const image = slides.slides[i] && slides.slides[i].querySelector("img")
      if (image) image.loading = "eager"
    }
  }

  // Remembered as we go rather than read back on demand: hiding the dialog
  // resets its track's scroll to 0 and fires one last scroll event, so by the
  // time `close` runs the position is already gone.
  let shown = 0

  // Both ends are dead ends, so the arrow that would do nothing is taken away
  // rather than left to be clicked. `disabled` also drops it out of tab order.
  const paint = () => {
    if (counter) counter.textContent = `${shown + 1} / ${slides.slides.length}`
    if (prev) prev.disabled = shown === 0
    if (next) next.disabled = shown === slides.slides.length - 1
    markStrip(filmstrip, filmButtons, shown)
  }

  const goTo = (index, behavior) => {
    shown = Math.min(slides.slides.length - 1, Math.max(0, index))
    preload(shown)
    slides.goTo(shown, behavior)
    paint()
  }

  // Swiping moves the track without going through goTo, so follow it — but
  // only while the dialog is actually open.
  const followScroll = () => {
    if (!dialog.open) return

    shown = slides.index()
    paint()
  }

  gallery.querySelectorAll("[data-gallery-open]").forEach((button) => {
    button.addEventListener("click", () => {
      dialog.showModal()
      goTo(Number(button.dataset.galleryOpen))
    })
  })

  filmButtons.forEach((button) => {
    button.addEventListener("click", () => goTo(Number(button.dataset.galleryJump), "smooth"))
  })

  if (prev) prev.addEventListener("click", () => goTo(slides.index() - 1, "smooth"))
  if (next) next.addEventListener("click", () => goTo(slides.index() + 1, "smooth"))

  const close = gallery.querySelector("[data-gallery-close]")
  if (close) close.addEventListener("click", () => dialog.close())

  // Clicks that land on the dialog itself rather than on a slide are backdrop clicks.
  dialog.addEventListener("click", (event) => {
    if (event.target === dialog || event.target === track) dialog.close()
  })

  dialog.addEventListener("keydown", (event) => {
    if (event.key === "ArrowLeft") {
      event.preventDefault()
      goTo(slides.index() - 1, "smooth")
    } else if (event.key === "ArrowRight") {
      event.preventDefault()
      goTo(slides.index() + 1, "smooth")
    }
  })

  // Come back to whichever image you were looking at full-screen.
  dialog.addEventListener("close", () => {
    lead.goTo(shown)
    markStrip(strip, stripButtons, shown)
  })

  track.addEventListener("scroll", followScroll, { passive: true })
}

document.querySelectorAll("[data-gallery]").forEach(setupGallery)
