$(function(){
  var loginAction = $('#login_action')
  loginAction.click(function(){
    $('#login_modal').fadeIn();
  })
  var mailBer = $('#mail_login')
  mailBer.on('click', function(){
    $('.login_contents').hide();
  })
})


// mergeの時に間違えて消去してしまったファイルが複数あるのでコメントアウト
// 現在、ファイル作成中
// ビューファイルを修正次第、動作確認

// $(function(){

//   var firstLoginSection = $('.login_contents')
//   var loginAction = $('#login_action')
//   var loginModal = $('#login_modal')
//   var mailBer = $('#mail_login')
//   var redirectLogin = $('.login_session_contents')
//   var redirectSignup = $('#signup_action')
//   var signupSession = $('') //間違えて消してしまったsignupファイル"後で作る"
//   var registrationMailSection = $('') //消してしまったsignupファイルのmailbtn
//   var loginMailSession = $('.signup_registration_contents')
//   var redirectLoginBtn = $('redirect_login_btn')
//   var actionPassword = $('.click_password')

//   loginAction.click(function(){
//     loginModal.fadeIn();
//   })
//   mailBer.on('click', function(){
//     firstLoginSection.hide();
//     redirectLogin.fadeIn();
//   })
//   redirectSignup.on('click', function(){
//     firstLoginSection.hide();
//     signupSession.fadeIn();
//     registrationMailSection.on('click',function(){
//       signupSession.hide();
//       loginMailSession.fadeIn();
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
//         redirectLoginBtn.on('click',function(){
//           loginMailSession.hide();
//           firstLoginSection.fadeIn();
//         })
//       })
//     })
//   })
// })
