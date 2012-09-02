jQuery ->
  input = $('input[id$="_tag_tokens"]')
  input.tokenInput '/' + input.data('locale') + '/tags.json'
    theme: 'facebook'
    prePopulate: input.data('preload')
