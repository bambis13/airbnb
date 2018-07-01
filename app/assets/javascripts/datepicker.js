$(document).ready(function(){
  var dateFormat   = 'yy/mm/dd',
      animFormat   = 'fadeIn',
      homeId       = getId(),
      $checkinBtn  = $('.reservation-checkin'),
      $checkoutBtn = $('.reservation-checkout');

  function getReservedData() {
    return $.ajax({
        type: 'GET',
        url: '/home_reservations/'+homeId,
        dataType: 'json'
    });
  }

  getReservedData().then(function(data) {
    console.log(data);
    var disableDates = data.disables
    $checkinBtn.datepicker({
      numberOfMonths: 1,
      dateFormat: dateFormat,
      showAnim: animFormat,
      minDate: data.min,
      maxDate: data.max,
      beforeShowDay: function(day){
        var dtFullDate = buildDateString(day);
        if(disableDates.indexOf(dtFullDate) >= 0){
            return [false];
        } else if(disableDates.indexOf(dtFullDate) == -1){
            return [true];
        }
      }
    });
  });

  $checkinBtn.change(function(){
    var inputCheckin = $checkinBtn.val();
    $.ajax({
      type: 'GET',
      url: '/calc_checkout/'+homeId,
      data: { checkin: inputCheckin},
      dataType: 'json'
    })
    .done(function(checkout) {
      $checkoutBtn.datepicker("destroy");
      $checkoutBtn.datepicker({
        dateFormat: dateFormat,
        showAnim: animFormat,
        minDate: checkout.shortest,
        maxDate: checkout.longest
      });
    })
    .fail(function() {
      alert('予約の取得に失敗しました');
    })
  });
});
