// $(function(home) {
// $("#reservation_new").on("input", function() {

//     //滞在期間 -①
//     var checkin_date = $('.checkin_date_input').val();
//     var checkout_date = $('.checkout_date_input').val();
//     var duration_of_stay = checkout_date - checkin_date;

//     //宿泊料金(1日) -②
//     var accomodation_fee = ${home.price.accomodation_fee};
//     var number_of_guests = $('.number_of_guests_input').val();
//     var fee_for_additional_people = ${home.price.additional_fee_per_person} * number_of_guests;

//     //小計 ①+②
//     var sub_total = (accomodation_fee + fee_for_additional_people) * duration_of_stay;

//     //その他料金
//     var cleaning_fee = $('.cleaning_fee_date_input').val();
//     var service_fee = $('.service_fee_input').val();

//     //合計
//     var total_price = sub_total + cleaning_fee + service_fee


//     $('.reservation_new__body--hidden').css({
//       'display':'block'
//     });

//     $('.accomodation_fee_per_night').val(accomodation_fee);
//     $('.total_price_input').val(total_price);

//   })
// });

// //
// // ①railsのコントローラの値を代入（変数展開があっているか）→合ってる
// // ②隠してある値を出す。→だす
// // ③正しい合計をformから送れるようにする
