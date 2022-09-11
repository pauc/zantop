import TomSelect from "tom-select"

document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("[data-behaviour='work-form']")

  if (!form) {
    return
  }

  setupAddingNestedRecords(form, "sections")
  setupAddingNestedRecords(form, "images")
  setupRemovingNestedRecords(form)
  setupPositionControls(form)
  setupTagsInput(form)
})

const setupAddingNestedRecords = (form, associationName) => {
  const fieldset = form.querySelector(`fieldset.${associationName}`)
  const template = form.querySelector(`#template-for-${associationName}`)

  let addedRecords = 0

  fieldset.querySelector("[data-behaviour='add-record']").addEventListener("click", event => {
    event.stopPropagation()
    event.preventDefault()

    addRecord(
      event.target,
      fieldset,
      template,
      addedRecords += 1
    )
  })
}

const addRecord = (button, fieldset, template, virtualId) => {
  const content     = template.content.cloneNode(true)
  const inputs      = content.querySelectorAll("input:not(.trix-input, .trix-button), textarea:not(.trix-input, .trix-button)")
  const labels      = content.querySelectorAll("label")
  const trixEditors = content.querySelectorAll("trix-editor")

  virtualId += 999_999_999_999_000

  inputs.forEach(input => {
    input.id = input.id.replace("_0_", `_new-record-${virtualId}_`)
    input.name = input.name.replace("[0]", `[${virtualId}]`)
  })

  labels.forEach(label => {
    label.attributes.for.value = label.attributes.for.value.replace("_0_", `_new-record-${virtualId}_`)
  })

  trixEditors.forEach(trixEditor => {
    trixEditor.id = trixEditor.id.replace("_0_", `_new-record-${virtualId}_`)
    trixEditor.setAttribute("input", trixEditor.getAttribute("input").replace("_0_", `_new-record-${virtualId}_`))
  })

  setupPositionControls(content)

  fieldset.insertBefore(content, button)
  setPositionValues(fieldset)
}

const setupRemovingNestedRecords = form => {
  form.addEventListener("click", event => {
    const clickedElement = event.target

    if (clickedElement.dataset.behaviour !== "remove-record") {
      return
    }

    const fields = clickedElement.closest(".fields")

    if (fields.dataset.newRecord === "true") {
      fields.remove()

      return
    }

    const _destroyInput = fields.querySelector("[data-attribute='_destroy']")

    _destroyInput.value = "true"

    fields.insertAdjacentElement("beforebegin", _destroyInput)

    fields.remove()
  })
}

const setupPositionControls = form => {
  form.addEventListener("click", event => {
    const clickedElement = event.target

    if (!["move-up", "move-down"].includes(clickedElement.dataset.behaviour)) {
      return
    }

    let direction = "up"

    if (clickedElement.dataset.behaviour === "move-down") {
      direction = "down"
    }

    changePosition(clickedElement.closest(".fields"), direction)
  })
}

const changePosition = (fields, direction) => {
  const fieldset = fields.closest("fieldset")

  let sibling

  if (direction === "up") {
    sibling = fields.previousElementSibling
  } else {
    sibling = fields.nextElementSibling
  }

  if (!sibling.classList.contains("fields")) {
    return
  }

  if (direction === "up") {
    fieldset.insertBefore(fields, sibling)
  } else {
    sibling.after(fields)
  }

  setPositionValues(fieldset)
}

const setPositionValues = fieldset => {
  const fields = fieldset.querySelectorAll(".fields")

  fields.forEach( (inputGroup, index) => {
    inputGroup.querySelector("[data-attribute='position']").value = index + 1
  })
}

const setupTagsInput = (form) => {
  new TomSelect("[data-attribute='tags']", {
    create: true,
    createFilter: function(input) {
      if (input.length < 3) return false
      if (input.toLowerCase() in this.options) return false

      return true
    },
    persist: false,
    maxOptions: 8
  })
}
