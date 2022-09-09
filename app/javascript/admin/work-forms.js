document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("[data-behaviour='work-form']")

  if (!form) {
    return
  }

  setupAddingNestedRecords(form, "sections")
  setupAddingNestedRecords(form, "images")
  setupPositionControls(form)
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
  const content = template.content.cloneNode(true)
  const inputs = content.querySelectorAll("input, textarea")
  const labels = content.querySelectorAll("label")

  virtualId += 999_999_999_999_000

  inputs.forEach(input => {
    input.id = input.id.replace("_0_", `_new-record-${virtualId}_`)
    input.name = input.name.replace("[0]", `[${virtualId}]`)
  })

  labels.forEach(label => {
    label.attributes.for.value = label.attributes.for.value.replace("_0_", `_new-record-${virtualId}_`)
  })

  setupPositionControls(content)

  fieldset.insertBefore(content, button)
  setPositionValues(fieldset)
}

const setupPositionControls = element => {
  element.querySelectorAll("[data-behaviour='move-up'], [data-behaviour='move-down']").forEach(control => {
    control.addEventListener("click", event => {
      let direction = "up"

      if (event.target.dataset.behaviour === "move-down") {
        direction = "down"
      }

      changePosition(event.target.closest(".fields"), direction)
    })
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
