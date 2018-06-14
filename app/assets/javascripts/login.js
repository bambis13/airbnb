$(function(){
  var loginAction = $('#login_action')
  loginAction.click(function(){
    $('#login_modal').fadeIn();
  })
  var mailBer = $('#mail_login')
  mailBer.on('click', function(){
    $('.login_contents').hide();
  })
  var redirectSignup = &('#signup_action')
  var signupSession = &('')
  redirectSignup.on('click', function(){
    $('.login_contents').hide();

  })
})
