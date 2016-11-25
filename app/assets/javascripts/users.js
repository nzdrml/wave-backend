$(document).ready(function(){

  $('.top-up').on('click', function(e){
    e.preventDefault();
    $(this).siblings('.form').show();
    $(this).hide();
  });

  $('.top-up-cancel').on('click', function(e){
    e.preventDefault();
    var $form = $(this).parents('.form');
    $form.hide();
    $form.find('#amount').val('');
    $form.siblings('.top-up').show();
  });

})
