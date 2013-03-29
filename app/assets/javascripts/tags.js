$(function() {
  var input;
  input = $('input[id$="_tag_tokens"]');
  return input.tokenInput('/' + input.data('locale') + '/tags.json', {
    theme: 'facebook',
    prePopulate: input.data('preload')
  });
});