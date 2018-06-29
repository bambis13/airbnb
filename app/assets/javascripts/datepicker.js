$(document).ready(function(){
  var dateFormat  = 'yy/mm/dd',
      animFormat  = 'fadeIn',
      minDate     = '+' + $('#min_date').text() + 'd',
      maxDate     = '+' + $('#max_date').text() + 'm',
      homeId      = getId(),
      $checkinBtn  = $('.reservation-checkin'),
      $checkoutBtn = $('.reservation-checkout');

  function getReservedData() {
    return $.ajax({
        type: 'GET',
        url: '/home_reservations/'+homeId,
        dataType: 'json'
    });
  }

  getReservedData().then(function(reservedData) {
    $checkinBtn.datepicker({
      numberOfMonths: 1,
      dateFormat: dateFormat,
      showAnim: animFormat,
      minDate: minDate,
      maxDate: maxDate,
      beforeShowDay: function(day){
        var dtFullDate = buildDateString(day);
        if(reservedData.indexOf(dtFullDate) >= 0){
            return [false];
        } else if(reservedData.indexOf(dtFullDate) == -1){
            return [true];
        }
      }
    });
  });

  $checkinBtn.change(function(){
    getReservedData().then(function(reservedData) {
      var inputCheckin = $checkinBtn.val();
      $.ajax({
        type: 'GET',
        url: '/get_checkout/'+homeId,
        data: { checkin: inputCheckin, reserved: reservedData},
        dataType: 'json'
      })
      .done(function(checkout) {
        $checkoutBtn.datepicker("destroy");
        $checkoutBtn.datepicker({
          dateFormat: dateFormat,
          showAnim: animFormat,
          minDate: checkout.min,
          maxDate: checkout.max
        });
      })
      .fail(function() {
        alert('予約の取得に失敗しました');
      })
    });
  });
});
