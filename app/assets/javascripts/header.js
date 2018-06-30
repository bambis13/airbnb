$(function(){
  const hiddenMenu = $('#hidden_menu')
  const userField = $('#user_field')
  hiddenMenu.on('mouseover', function(){
    userField.fadeIn();
    event.preventDefault();
  })
  $('.contents').on('click', function(){
    userField.fadeOut();
  })
})
