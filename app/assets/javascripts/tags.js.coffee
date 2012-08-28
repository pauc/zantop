jQuery ->
  $('#visual_work_tag_tokens').tokenInput '/' + $('#visual_work_tag_tokens').data('locale') + '/tags.json'
    theme: 'facebook'
    prePopulate: $('#visual_work_tag_tokens').data('preload')
