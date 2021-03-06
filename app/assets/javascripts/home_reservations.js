$(window).load(function (){
  if(document.URL.match("homes/" + "[0-9０-９]")) {
    var $adultUp        = $(".count-up-adult"),
        $adultDown      = $(".count-down-adult"),
        $childrenUp     = $(".count-up-children")
        $childrenDown   = $(".count-down-children"),
        $babiesUp       = $(".count-up-babies"),
        $babiesDown     = $(".count-down-babies"),
        $adultForm      = $('.form-text-adult'),
        $adultHtml      = $('.number-of-adult-html'),
        $childrenHtml   = $('.number-of-children-html'),
        $babiesHtml     = $('.number-of-babies-html'),
        $adultHidden    = $('input:hidden[class="number-of-adult-sa"]'),
        $childrenHidden = $('input:hidden[class="number-of-children-sa"]'),
        $babiesHidden   = $('input:hidden[class="number-of-babies-sa"]'),
        $maxGuestsNum   = parseInt($('#max_guests_num').text()),
        $rotate         = $('#rotate'),
        $adultId        = 0,
        $childrenId     = 1,
        $babiesId       = 2,
        homeId          = getId();


    function calc_prices(){
      var checkin       = Date.parse($('.reservation-checkin').val()),
          checkout      = Date.parse($('.reservation-checkout').val()),
          days          = (checkout - checkin)/1000/60/60/24,
          countAdult    = parseInt($adultHidden.val()),
          countChildren = parseInt($childrenHidden.val()),
          guestsSum     = countAdult + countChildren;
      if (days > 0) {
        $.ajax({
          type: 'GET',
          url: '/home_reservations/new',
          data: { days: days, guests_sum: guestsSum, id: homeId },
          dataType: 'json'
        })
        .done(function(data) {
          $('#default_price').text(currency(data.per_day));
          $('#total_price').text(currency(data.total));
          $('.per_day').text(currency(data.per_day));
          $('.stay_day').text(currency(data.per_day)+" × "+staydays(days));
          $('.variable_sum').text(currency(data.variable));
          $('input:hidden[class="total_fee"]').val(data.total);
          $('input:hidden[class="per_day_fee"]').val(data.per_day);
          $('.reservation_new__result').removeClass('removed');
          close_select_guests();
        })
        .fail(function() {
          alert('料金計算に失敗しました');
        })
      }
      else {
        $('.reservation-checkout').val("");
        return false
      }
      return false
    }

    function close_select_guests(){
      $rotate.removeClass('fa-angle-up');
      $rotate.addClass('fa-angle-down');
      $('#select-guests-num').css('visibility','hidden');
    }

    $('#guests-num-btn').on('click',
      function(){
      $rotate.removeClass('fa-angle-down');
      $rotate.addClass('fa-angle-up');
      $('#select-guests-num').css('visibility','visible');
    });

    $('.close-button').on('click',function(e){
      e.preventDefault();
      calc_prices();
      close_select_guests()
    });

    $('.calc-listner').on('change',function(){
      calc_prices();
    });

    function upCount(countNum,hiddenVal,numText,formText,id){
      countNum += 1;
      hiddenVal.val(countNum);
      numText.text(countNum);
      if(formText.length){
        formText.text(buildGuestsNum(id, countNum));
      }else{
        $('.form-texts').append(buildNewGuestsNum(id, countNum));
      }
    }

    function downCount(countNum,hiddenVal,numText,formText,id){
      countNum -= 1;
      hiddenVal.val(countNum);
      numText.text(countNum);
      formText.text(buildGuestsNum(id, countNum));
    }
       //大人
    $adultUp.on('click',function(e) {
      e.preventDefault();
      $adultDown.prop("disabled", false);
      var countAdult    = parseInt($adultHidden.val());
      var countChildren = parseInt($childrenHidden.val());
      var guestsSum     = countAdult + countChildren
      upCount(countAdult,$adultHidden,$adultHtml,$adultForm,$adultId);
      if (guestsSum >= $maxGuestsNum - 1){
        $(this).prop("disabled", true);
        $childrenUp.prop("disabled", true);
      }
    });
    $adultDown.on('click',function(e) {
      e.preventDefault();
      $adultUp.prop("disabled", false);
      $childrenUp.prop("disabled", false);
      var countAdult = parseInt($adultHidden.val());
      downCount(countAdult,$adultHidden,$adultHtml,$adultForm,$adultId);
      if (countAdult <= 2){
        $(this).prop("disabled", true);
      }
    });

      //子供
    $childrenUp.on('click',function(e) {
      e.preventDefault();
      $childrenDown.prop("disabled", false);
      var $childrenForm = $('.form-text-children');
      var countAdult    = parseInt($adultHidden.val());
      var countChildren = parseInt($childrenHidden.val());
      var guestsSum = countAdult + countChildren
      upCount(countChildren,$childrenHidden,$childrenHtml,$childrenForm,$childrenId);
      if (guestsSum >= $maxGuestsNum - 1){
        $(this).prop("disabled", true);
        $adultUp.prop("disabled", true);
      }
    });
    $childrenDown.on('click',function(e) {
      e.preventDefault();
      $adultUp.prop("disabled", false);
      $childrenUp.prop("disabled", false);
      var $childrenForm   = $('.form-text-children');
      var countChildren = parseInt($childrenHidden.val());
      if (countChildren > 1){
        downCount(countChildren,$childrenHidden,$childrenHtml,$childrenForm,$childrenId);
      }else{
        countChildren -= 1;
        $childrenHidden.val(countChildren);
        $childrenHtml.text(countChildren);
        $childrenForm.remove();
        $(this).prop("disabled", true);
      }
    });

      //乳幼児
    $babiesUp.on('click',function(e) {
      e.preventDefault();
      $babiesDown.prop("disabled", false);
      var $babiesForm = $('.form-text-babies');
      var countBabies = parseInt($babiesHidden.val());
      upCount(countBabies,$babiesHidden,$babiesHtml,$babiesForm,$babiesId);
      if (countBabies >= 4){
        $(this).prop("disabled", true);
      }
    });
    $babiesDown.on('click',function(e) {
      e.preventDefault();
      $babiesUp.prop("disabled", false);
      var $babiesForm = $('.form-text-babies');
      var countBabies = parseInt($babiesHidden.val());
      if (countBabies > 1){
        downCount(countBabies,$babiesHidden,$babiesHtml,$babiesForm,$babiesId);
      }else{
        countBabies -= 1;
        $babiesHidden.val(countBabies);
        $babiesHtml.text(countBabies);
        $babiesForm.remove();
        $(this).prop("disabled", true);
      }
    });
  }
});//一番上のfunction閉じ
