(->
  $.fn.extend initSortableFields: ->
    @each ->
      $self = $(this)

      # Initialize CKEditor in some textarea
      initEditor = (textareaId) ->
        CKEDITOR.replace textareaId,
          height: '5em'

      destroyEditor = (textareaId) ->
        CKEDITOR.instances[textareaId].destroy()

      # Insert event handlers
      $self.on 'click', '.sort-field a', (event) ->
        $this = $(this)
        field = $this.closest('div.fields')
        destroyEditor field.find('.rich-text-area').attr('id')
        field.insertBefore field.prev('.fields') if $this.hasClass('up')
        field.insertAfter field.next('.fields') if $this.hasClass('down')
        initEditor field.find('.rich-text-area').attr('id')

      $(document).on "nested:fieldAdded", (event) ->
        event.field.parent('p').before(event.field)
        initEditor event.field.find('.rich-text-area').attr('id')

      setPositions = ->
        $(this).find('.sortable-fieldset').each ->
          $self.find('.fields').each (index) ->
            $(this).find('input[id$="position"]').attr('value', index + 1)

      $self.on 'submit', setPositions

      $.each $self.find('.rich-text-area'), ->
        initEditor $(this).attr('id')

  $('form.with-sortable-fields').initSortableFields()
)()
