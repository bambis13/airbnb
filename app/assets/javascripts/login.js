$(function(){

  const loginAction = $('#login_action')
  const loginModal = $('#login_modal')
  const firstLoginField = $('.login_contents')
  const mailLogin = $('#mail_login')
  const loginField = $('.login_session_contents')
  const switchSignupBranch = $('#switch_signup_branch')
  const signupAction = $('#signup_action')
  const redirectLogin = $('#redirect_login')
  const signupBranch = $('.signup_branch_contents')
  const switchLoginField = $('#mail_signup_field')
  const loginMailField = $('.signup_registration_contents')
  const switchCovenantSection = $('.registration_btn')
  const covenantField = $('.covenant_section_contents')
  const agreeAction = $('#agree_action')
  const disagreeAction = $('#disagree_action')
  const signupWelcome = $('.welcome_section_contents')
  const switchProfileField = $('#next_field')
  const profileField = $('.signup_profile_contents')
  const switchPhoneNumber = $('#switch_phone_number')
  const phoneNumberField = $('.signup_phone_number_contents')
  const switchMailCertification = $('#switch_mail_certification')
  const mailCertificationField = $('.signup_mail_certification_contents')
  const switchOneMoreSction = $('#switch_one_more_section')
  const oneMoreSectionField = $('.signup_one_more_contents')
  const switchFinishSection = $('#switch_finish_section')
  const finishField = $('.signup_finish_contents')
  const returnLogin = $('#return_login')

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

  switchCovenantSection.on('submit', function(){
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

