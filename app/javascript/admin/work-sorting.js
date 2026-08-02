document.addEventListener("DOMContentLoaded", () => {
  const list = document.querySelector("[data-behaviour='sortable-works']")

  if (!list) {
    return
  }

  setupDragging(list)
  setupPositionControls(list)
})

const setupDragging = list => {
  let dragged = null
  let orderOnPickUp = null

  list.addEventListener("dragstart", event => {
    dragged = event.target.closest(".sortable-item")

    if (!dragged) {
      return
    }

    orderOnPickUp = currentIds(list).join()
    dragged.classList.add("dragging")

    event.dataTransfer.effectAllowed = "move"
    // Firefox refuses to start a drag unless some data comes with it.
    event.dataTransfer.setData("text/plain", dragged.dataset.id)
  })

  // Reordering happens here rather than on `drop`, so the list reflows under
  // the cursor and shows where the work will land before it is let go.
  list.addEventListener("dragover", event => {
    if (!dragged) {
      return
    }

    event.preventDefault()
    event.dataTransfer.dropEffect = "move"

    const follower = itemBelow(list, event.clientY)

    if (follower !== dragged) {
      list.insertBefore(dragged, follower)
    }
  })

  // Without this the browser handles the drop itself and navigates away.
  list.addEventListener("drop", event => event.preventDefault())

  list.addEventListener("dragend", () => {
    if (!dragged) {
      return
    }

    const dropped = dragged

    dropped.classList.remove("dragging")
    dragged = null

    // A drag that ends where it started, or one the user cancelled with Escape,
    // leaves the order untouched and is not worth a request.
    if (currentIds(list).join() === orderOnPickUp) {
      return
    }

    announcePosition(list, dropped)
    persistOrder(list)
  })
}

// The keyboard path onto the same endpoint. A pointer is the only way through
// the drag events above, and the up/down control is the pattern the work forms
// already use for sections and images. Buttons rather than the anchors those
// use: a control that reorders a list is a button, and only a button answers
// to the space bar as well as to Enter.
const setupPositionControls = list => {
  list.addEventListener("click", event => {
    const button = event.target.closest("[data-behaviour^='move-']")

    if (!button) {
      return
    }

    moveItem(list, button, button.dataset.behaviour === "move-up" ? "up" : "down")
  })
}

const moveItem = (list, button, direction) => {
  const item = button.closest(".sortable-item")
  const sibling = direction === "up"
    ? item.previousElementSibling
    : item.nextElementSibling

  // The buttons at the two ends of the list stay enabled and say why nothing
  // happened. Disabling them would take the focus off the control the moment
  // a work reached the top, dropping a keyboard user back at the document.
  if (!sibling) {
    const edge = direction === "up" ? "el primer" : "l'últim"

    announceMove(`«${titleOf(item)}» ja és ${edge} treball.`)

    return
  }

  if (direction === "up") {
    list.insertBefore(item, sibling)
  } else {
    sibling.after(item)
  }

  // Taking the row out of the list and putting it back blurs whatever inside
  // it had the focus, which drops a keyboard user on the document body after a
  // single press. Handing it back is what makes a second press possible, and
  // what carries the focus ring down the page with the work.
  button.focus()

  announcePosition(list, item)
  persistOrder(list)
}

// The first item whose midpoint the cursor has not yet passed — the one the
// dragged work should sit above. `null` means it belongs at the end.
const itemBelow = (list, y) =>
  items(list)
    .filter(item => !item.classList.contains("dragging"))
    .find(item => {
      const box = item.getBoundingClientRect()

      return y < box.top + box.height / 2
    }) || null

const items = list => [...list.querySelectorAll(".sortable-item")]

const currentIds = list => items(list).map(item => item.dataset.id)

const titleOf = item => item.querySelector(".work-title").textContent.trim()

// Where the work landed, counted the way the screen reads: the row at the top
// of the list is the first one.
const announcePosition = (list, item) => {
  const all = items(list)

  announceMove(`«${titleOf(item)}»: posició ${all.indexOf(item) + 1} de ${all.length}.`)
}

// Clearing the save alongside it, so the outcome of the last move is never
// left standing next to the report of the one after it.
const announceMove = message => {
  announce("sorting-position", message)
  announce("sorting-save", "")
}

const announce = (behaviour, message) => {
  const region = document.querySelector(`[data-behaviour='${behaviour}']`)

  if (region) {
    region.textContent = message
  }
}

// Long enough that moving a work several rows with the buttons sends one
// request instead of one per press. Two requests in flight at once would each
// permute the order they were sent, and the one that committed last would win
// whichever of them the user meant.
const SAVE_DELAY = 400

let pendingSave = null

const persistOrder = list => {
  clearTimeout(pendingSave)

  pendingSave = setTimeout(() => save(list), SAVE_DELAY)
}

const save = list => {
  fetch(list.dataset.url, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "X-CSRF-Token": document.querySelector("meta[name='csrf-token']")?.content
    },
    body: JSON.stringify({ work_ids: currentIds(list) })
  })
    .then(response => reportSave(list, response.ok))
    .catch(() => reportSave(list, false))
}

const reportSave = (list, saved) => {
  list.classList.remove("saved", "save-failed")
  // Forcing a reflow restarts the animation when drops land back to back.
  void list.offsetWidth
  list.classList.add(saved ? "saved" : "save-failed")

  announce("sorting-save", saved ? "Ordre desat." : "No s'ha pogut desar l'ordre.")
}
