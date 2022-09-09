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
        contentContainer.insertAdjacentHTML("beforeend", content)
      })

    currentPage += 1

    if (totalPages === currentPage) {
      paginationContainer.innerHTML = ""
    }
  })
})
