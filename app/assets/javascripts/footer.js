$(function(){
  var showFooter = $('#show__footer')
  var hideFooter = $('#hide__footer')
  showFooter.on('click', function(){
    $('.footer').slideDown('fast');
    showFooter.addClass('hide')
    hideFooter.removeClass('hide')
  });
  hideFooter.on('click', function(){
    $('.footer').slideUp('fast');
    hideFooter.addClass('hide')
    showFooter.removeClass('hide')
  });
});
