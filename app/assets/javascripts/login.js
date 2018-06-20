$(function(){

  var loginAction = $('#login_action')
  var loginModal = $('#login_modal')
  var firstLoginField = $('.login_contents')
  var mailLogin = $('#mail_login')
  var loginField = $('.login_session_contents')
  var switchSignupBranch = $('#switch_signup_branch')
  var signupAction = $('#signup_action')
  var redirectLogin = $('#redirect_login')
  var signupBranch = $('.signup_branch_contents')
  var switchLoginField = $('#mail_signup_field')
  var loginMailField = $('.signup_registration_contents')
  var switchCovenantSection = $('.registration_btn')
  var covenantField = $('.covenant_section_contents')
  var agreeAction = $('#agree_action')
  var disagreeAction = $('#disagree_action')
  var signupWelcome = $('.welcome_section_contents')
  // var registrationMailSection = $('.signup_mail_certification_contents')
  // var redirectLoginBtn = $('redirect_login_btn')
  // var actionPassword = $('.click_password')

  loginAction.click(function(){
    loginModal.fadeIn();
    firstLoginField.fadeIn();
  })
  mailLogin.on('click', function(){
    firstLoginField.hide();
    loginField.fadeIn();
  })
  signupAction.on('click', function(){
    firstLoginField.hide();
    signupBranch.fadeIn();
  })
  switchSignupBranch.on('click', function(){
    loginField.hide();
    signupBranch.fadeIn();
  })
  redirectLogin.on('click', function(){
    signupBranch.hide();
    firstLoginField.fadeIn();
  })
  switchLoginField.on('click', function(){
    signupBranch.hide();
    loginMailField.fadeIn();
  })
  switchCovenantSection.on('click', function(){
    loginMailField.hide();
    covenantField.fadeIn();
  })
  agreeAction.on('click', function(){
    covenantField.hide();
    signupWelcome.fadeIn();
  })
  disagreeAction.on('click', function(){
    covenantField.hide();
    firstLoginField.fadeIn();
  })
  // registrationMailSection.on('click',function(){
  //   signupBranch.hide();
  //   loginMailSession.fadeIn();
  // })
  // redirectLoginBtn.on('click',function(){
  //   loginMailSession.hide();
  //   firstLoginFiled.fadeIn();
  // })
})


//       actionPassword.on('click', function(){
//         actionPassword.append(PasswordFiledHTML)
//           PasswordFiledHTML =
//                `<div class='field_password_certifcation'>
//                   <div class='field_password_certifcation__mark'>
//                   </div>
//                   <div class='field_password_certifcation__text'>
//                   </div>
//                 </div>
//                 <div class='field_password_certifcation'>
//                   <div class='field_password_certifcation__mark'>
//                   </div>
//                   <div class='field_password_certifcation__text'>
//                   </div>
//                 </div>
//                 <div class='field_password_certifcation'>
//                   <div class='field_password_certifcation__mark'>
//                   </div>
//                   <div class='field_password_certifcation__text'>
//                   </div>
//                 </div>
//                 <div class='field_password_certifcation'>
//                   <div class='field_password_certifcation__mark'>
//                   </div>
//                   <div class='field_password_certifcation__text'>
//                   </div>
//                 </div>`
//         //field_password_certifcationのmarkとtextは非同期で表示が変わる（正規表現で取得)
