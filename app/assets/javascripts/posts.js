//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position
//= require jquery.ui.sortable

$(function(){
  $('#posts').sortable({
    axis: 'y',
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function(){
      $.ajax({
      type: 'post',
      data: $('#posts').sortable('serialize'),
      dataType: 'script',
      complete: function(request){
        $('#posts').effect('highlight');
      },
      url: '/ca/posts/sort'})
    }
  });
});