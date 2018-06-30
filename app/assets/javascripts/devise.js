// $(function(){

// //headerのログインボタン
//   let loginAction = $('#login_action')
// //modalbackgroundの指定
//   let backGround = $('.modal_background')
// //modalwindow要素を挿入先
//   let baseContent = $('.modal_contents')
// //login_content
//   const loginContentsHTML =
//     `<div class='login_contents'>
//       <div class='top_content'>
//       </div>
//       <div class='correction_position_top'></div>
//       <div class='body_content'>
//         <div class='title_content'>
//           <h1>ログイン</h1>
//         </div>
//         <div class='correction_position_center_top'></div>
//         <div class='facebook_login_ber'>
//           <div class='facebook_login_btn'>
//             <a class='redirect_btn'>
//               <h3>Facebookでログイン</h3>
//             </a>
//           </div>
//         </div>
//         <div class='correction_position_center_bottom'></div>
//         <div class='border_line'>
//           <div class='border_line__content'>または</div>
//           <hr>
//         </div>
//         <div class='split_button'>
//           <div class='left_login_btn' id='mail_login'>
//             <a class='redirect_btn'>
//               <h3>メールアドレス</h3>
//             </a>
//           </div>
//           <div class='right_login_btn'>
//             <a class='redirect_btn'>
//               <h3>Google</h3>
//             </a>
//           </div>
//         </div>
//         <div class='bottom_content'>
//           <div class='bottom_content__text_area'>アカウントはお持ちでないですか？</div>
//           <a class='redirect_btn' id='signup_action'>登録</a>
//         </div>
//       </div>
//     </div>
//     `

//   loginAction.click(function(){
//     backGround.fadeIn();
//     event.preventDefault();
//     $.ajax({
//       url: 'devise/shared/login_content.html',
//       type: 'GET',
//       dataType: 'html',
//       processData: false,
//       contentType: false
//     })
//     .done(function(html){
//       console.log(html);
//       baseContent.insertBefore(html);
//     })
//     .fail(function(){
//     })

//     // document.getErementByClassName('.modal_contents')
//     // element.parentNode.insertBefore(loginContents);

//   })

// });
