document.addEventListener("DOMContentLoaded", () => {
  const list = document.querySelector("[data-behaviour='sortable-works']")

  if (!list) {
    return
  }

  setupSorting(list)
})

const setupSorting = list => {
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

    dragged.classList.remove("dragging")
    dragged = null

    // A drag that ends where it started, or one the user cancelled with Escape,
    // leaves the order untouched and is not worth a request.
    if (currentIds(list).join() !== orderOnPickUp) {
      persistOrder(list)
    }
  })
}

// The first item whose midpoint the cursor has not yet passed — the one the
// dragged work should sit above. `null` means it belongs at the end.
const itemBelow = (list, y) => {
  const items = [...list.querySelectorAll(".sortable-item:not(.dragging)")]

  return items.find(item => {
    const box = item.getBoundingClientRect()

    return y < box.top + box.height / 2
  }) || null
}

const currentIds = list =>
  [...list.querySelectorAll(".sortable-item")].map(item => item.dataset.id)

const persistOrder = list => {
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
}
