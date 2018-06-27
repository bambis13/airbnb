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
  var switchProfileField = $('#next_field')
  var profileField = $('.signup_profile_contents')
  var switchPhoneNumber = $('#switch_phone_number')
  var phoneNumberField = $('.signup_phone_number_contents')
  var switchMailCertification = $('#switch_mail_certification')
  var mailCertificationField = $('.signup_mail_certification_contents')
  var switchOneMoreSction = $('#switch_one_more_section')
  var oneMoreSectionField = $('.signup_one_more_contents')
  var switchFinishSection = $('#switch_finish_section')
  var finishField = $('.signup_finish_contents')
  var returnLogin = $('#return_login')

  $('#modal_escape').on('click', function(){
    loginModal.fadeOut("slow");
    firstLoginField.fadeOut("slow");
    mailLogin.fadeOut("slow");
    loginField.fadeOut("slow");
    switchSignupBranch.fadeOut("slow");
    signupAction.fadeOut("slow");
    redirectLogin.fadeOut("slow");
    signupBranch.fadeOut("slow");
    switchLoginField.fadeOut("slow");
    loginMailField.fadeOut("slow");
    switchCovenantSection.fadeOut("slow");
    covenantField.fadeOut("slow");
    agreeAction.fadeOut("slow");
    disagreeAction.fadeOut("slow");
    signupWelcome.fadeOut("slow");
    switchProfileField.fadeOut("slow");
    profileField.fadeOut("slow");
    switchPhoneNumber.fadeOut("slow");
    phoneNumberField.fadeOut("slow");
    switchMailCertification.fadeOut("slow");
    mailCertificationField.fadeOut("slow");
    switchOneMoreSction.fadeOut("slow");
    oneMoreSectionField.fadeOut("slow");
    switchFinishSection.fadeOut("slow");
    finishField.fadeOut("slow");
    returnLogin.fadeOut("slow");
  })

  loginAction.click(function(){
    loginModal.fadeIn();
    firstLoginField.fadeIn();
    event.preventDefault();
  })

  mailLogin.on('click', function(){
    firstLoginField.hide();
    loginField.fadeIn();
    event.preventDefault();
  })

  signupAction.on('click', function(){
    firstLoginField.hide();
    signupBranch.fadeIn();
    event.preventDefault();
  })

  switchSignupBranch.on('click', function(){
    loginField.hide();
    signupBranch.fadeIn();
    event.preventDefault();
  })

  returnLogin.on('click', function(){
    loginMailField.hide();
    firstLoginField.fadeIn();
    event.preventDefault();
  })

  redirectLogin.on('click', function(){
    signupBranch.hide();
    firstLoginField.fadeIn();
    event.preventDefault();
  })

  switchLoginField.on('click', function(){
    signupBranch.hide();
    loginMailField.fadeIn();
    event.preventDefault();
  })

  switchCovenantSection.on('click', function(){
    loginMailField.hide();
    covenantField.fadeIn();
    event.preventDefault();
  })

  agreeAction.on('click', function(){
    covenantField.hide();
    signupWelcome.fadeIn();
    event.preventDefault();
  })

  disagreeAction.on('click', function(){
    covenantField.hide();
    firstLoginField.fadeIn();
    event.preventDefault();
  })

  switchProfileField.on('click', function(){
    signupWelcome.hide();
    profileField.fadeIn();
    event.preventDefault();
  })

  switchPhoneNumber.on('click', function(){
    profileField.hide();
    phoneNumberField.fadeIn();
    event.preventDefault();
  })

  switchMailCertification.on('click', function(){
    phoneNumberField.hide();
    mailCertificationField.fadeIn();
    event.preventDefault();
  })

  switchOneMoreSction.on('click', function(){
    mailCertificationField.hide();
    oneMoreSectionField.fadeIn();
    event.preventDefault();
  })

  switchFinishSection.on('click', function(){
    oneMoreSectionField.hide();
    finishField.fadeIn();
    event.preventDefault();
  })

})

