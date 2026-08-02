document.addEventListener("DOMContentLoaded", () => {
  const paginationContainer = document.querySelector("[data-behaviour='front-page-pagination']")

  if (!paginationContainer) {
    return
  }

  const replacementText     = paginationContainer.dataset.altText
  const replacementLink     = document.createElement("a")
  const contentContainer    = document.getElementById("works")
  const locale              = document.querySelector("html").lang
  const urlForMoreContent   = new URL(window.location)
  const totalPages          = parseInt(pagination.dataset.totalPages)
  let   currentPage         = parseInt((new URLSearchParams(window.location.search)).get("page") || 1)

  urlForMoreContent.pathname = `${locale}/more_works`
  replacementLink.href = urlForMoreContent
  replacementLink.append(replacementText)
  if (totalPages > currentPage) {
    paginationContainer.replaceChildren(replacementLink)
  } else {
    paginationContainer.innerHTML = ""

  }

  replacementLink.addEventListener("click", event => {
    event.stopPropagation()
    event.preventDefault()

    urlForMoreContent.searchParams.set("page", currentPage + 1)

    fetch(urlForMoreContent)
      .then(result => result.text())
      .then(content => {
        const lastBefore = contentContainer.lastElementChild
        contentContainer.insertAdjacentHTML("beforeend", content)

        // Land on the first work that was not there a moment ago. Without it
        // the click appends twelve works above the button and leaves focus on
        // the button — which the last page then deletes, dropping focus to the
        // body — so nothing announces what arrived and a keyboard has to walk
        // backwards to reach it.
        const firstAdded = lastBefore ? lastBefore.nextElementSibling
                                      : contentContainer.firstElementChild
        const title = firstAdded && firstAdded.querySelector("a")
        if (title) title.focus()
      })

    currentPage += 1

    if (totalPages === currentPage) {
      paginationContainer.innerHTML = ""
    }
  })
})
