$(window).load(function (){
  //人数選択フィールド出現
  $('#guests-num-btn').click(function(){
    $('#rotate').removeClass('fa-angle-down');
    $('#rotate').addClass('fa-angle-up');
    $('#select-guests-num').css('visibility','visible');
  });//人数選択フィールド閉じ
  //フィールド閉じる
  $('.close-button').on('click',function(e){
    e.preventDefault();
    calc_prices();
    $('#rotate').removeClass('fa-angle-up');
    $('#rotate').addClass('fa-angle-down');
    $('#select-guests-num').css('visibility','hidden');
  });

    //大人
    $(".count-up-adult").click(function(e) {
      e.preventDefault();
      $(".count-down-adult").prop("disabled", false);
      var maxGuestsNum  = parseInt($('input:hidden[name="max_guests_num"]').val());
      var countAdult    = parseInt($('input:hidden[name="number-of-adult-sa"]').val());
      var countChildren = parseInt($('input:hidden[name="number-of-children-sa"]').val());
      var guestsSum = countAdult + countChildren
      if (guestsSum < maxGuestsNum - 1){
        countAdult += 1;
        $('input:hidden[name="number-of-adult-sa"]').val(countAdult);
        p = parseInt($('input:hidden[name="number-of-adult-sa"]').val());
        $('.number-of-adult-html').text(countAdult);
        $('.form-text-adult').text("ゲスト" + countAdult + "人");
      }else{
        countAdult += 1;
        $('input:hidden[name="number-of-adult-sa"]').val(countAdult);
        $('.number-of-adult-html').text(countAdult);
        $('.form-text-adult').text("ゲスト" + countAdult + "人");
        $(this).prop("disabled", true);
        $(".count-up-children").prop("disabled", true);
      }
    });//大人up閉じ
    $(".count-down-adult").click(function(e) {
      e.preventDefault();
      $(".count-up-adult").prop("disabled", false);
      $(".count-up-children").prop("disabled", false);
      var countAdult = parseInt($('input:hidden[name="number-of-adult-sa"]').val());
      if (countAdult > 2){
      countAdult -= 1;
      $('input:hidden[name="number-of-adult-sa"]').val(countAdult);
      $('.number-of-adult-html').text(countAdult);
      $('.form-text-adult').text("ゲスト" + countAdult + "人");
      }else{
      countAdult -= 1;
      $('input:hidden[name="number-of-adult-sa"]').val(countAdult);
      $('.number-of-adult-html').text(countAdult);
      $('.form-text-adult').text("ゲスト1人");
      $(this).prop("disabled", true);
      }
    });//大人down閉じ

    //子供
    $(".count-up-children").click(function(e) {
      e.preventDefault();
      $(".count-down-children").prop("disabled", false);
      var maxGuestsNum  = parseInt($('input:hidden[name="max_guests_num"]').val());
      var countAdult    = parseInt($('input:hidden[name="number-of-adult-sa"]').val());
      var countChildren = parseInt($('input:hidden[name="number-of-children-sa"]').val());
      var guestsSum = countAdult + countChildren
      if (guestsSum < maxGuestsNum - 1){
        countChildren += 1;
        $('input:hidden[name="number-of-children-sa"]').val(countChildren);
        $('.number-of-children-html').text(countChildren);
        if($('.form-text-children').length){
          $('.form-text-children').text(", 子ども" + countChildren + "人");
        }else{
          $('.form-texts').append("<p class=\"form-text-children\">, 子ども1人</p>");
        }
      }else{
        countChildren += 1;
        $('input:hidden[name="number-of-children-sa"]').val(countChildren);
        $('.number-of-children-html').text(countChildren);
        $('.form-text-children').text(", 子ども" + countChildren + "人");
        $(this).prop("disabled", true);
        $(".count-up-adult").prop("disabled", true);
      }
    });//子供up閉じ
    $(".count-down-children").click(function(e) {
      e.preventDefault();
      $(".count-up-adult").prop("disabled", false);
      $(".count-up-children").prop("disabled", false);
      var countChildren = parseInt($('input:hidden[name="number-of-children-sa"]').val());
      if (countChildren > 1){
        countChildren -= 1;
        $('input:hidden[name="number-of-children-sa"]').val(countChildren);
        $('.number-of-children-html').text(countChildren);
        $('.form-text-children').text(", 子ども" + countChildren + "人");
      }else{
        countChildren -= 1;
        $('input:hidden[name="number-of-children-sa"]').val(countChildren);
        $('.number-of-children-html').text(countChildren);
        $('.form-text-children').remove();
        $(this).prop("disabled", true);
      }
    });//子供down閉じ

    //乳幼児
    $(".count-up-babies").click(function(e) {
      e.preventDefault();
      $(".count-down-babies").prop("disabled", false);
      var countBabies = parseInt($('input:hidden[name="number-of-babies-sa"]').val());
      if (countBabies < 4){
        countBabies += 1;
        if($('.form-text-babies').length){
          $('.form-text-babies').text(", 乳幼児" + countBabies + "人");
        }else{
          $('.form-texts').append("<p class=\"form-text-babies\">, 乳幼児1人</p>");
        }
        $('input:hidden[name="number-of-babies-sa"]').val(countBabies);
        $('.number-of-babies-html').text(countBabies);
        $('.form-text-babies').remove();
        $('.form-texts').append("<p class=\"form-text-babies\">, 乳幼児" + countBabies + "人</p>");
      }else{
        countBabies += 1;
        $('input:hidden[name="number-of-babies-sa"]').val(countBabies);
        $('.number-of-babies-html').text(countBabies);
        $('.form-text-babies').text(", 乳幼児" + countBabies + "人");
        $(this).prop("disabled", true);
        $(".count-up-babies").prop("disabled", true);
      }
    });//乳幼児up閉じ
    $(".count-down-babies").click(function(e) {
      e.preventDefault();
      $(".count-up-babies").prop("disabled", false);
      var countBabies = parseInt($('input:hidden[name="number-of-babies-sa"]').val());
      if (countBabies > 1){
        countBabies -= 1;
        $('.form-text-babies').text(", 乳幼児" + countBabies + "人");
        $('input:hidden[name="number-of-babies-sa"]').val(countBabies);
        $('.number-of-babies-html').text(countBabies);
        // $('.form-text-babies').remove();
        // $('.form-texts').append("<p class=\"form-text-babies\">, 乳幼児" + countBabies + "人</p>");
      }else{
        countBabies -= 1;
        $('input:hidden[name="number-of-babies-sa"]').val(countBabies);
        $('.number-of-babies-html').text(countBabies);
        $('.form-text-babies').remove();
        $(this).prop("disabled", true);
      }
    });//乳幼児down閉じ

  //スクロール固定
  // $(window).on('load', function () {
  //     // $navSetTop = $navSet.offset().top;
  //   $(window).on('scroll', function () {
  //     var $navSet = $('.nav-set').offset().top;
  //     console.log($navSet);
  //     if($navSet < 90) {
  //       $('.nav-set').addClass('is-fixed');
  //     } else {
  //       $('.nav-set').removeClass('is-fixed');
  //     }
  //   });
  // });
  function calc_prices(){
    var checkin = Date.parse($('.reservation-checkin').val());
    var checkout = Date.parse($('.reservation-checkout').val());
    var days = (checkout - checkin)/1000/60/60/24;
    var countAdult    = parseInt($('input:hidden[name="number-of-adult-sa"]').val());
    var countChildren = parseInt($('input:hidden[name="number-of-children-sa"]').val());
    var guestsSum = countAdult + countChildren
    if (days > 0) {
      var homeId = parseInt(location.pathname.split('/')[2]);
      $.ajax({
        type: 'GET',
        url: '/calc',
        data: { days: days, guests_sum: guestsSum, id: homeId},
        dataType: 'json'
      })
      .done(function(data) {
        var variable_price = data.per_day*days
        $('#default_price').text('¥ '+data.per_day);
        $('#total_price').text("¥ "+data.total);
        $('.per_day').text("¥ "+data.per_day);
        $('.stay_day').text("¥ "+data.per_day+" × "+days+"泊");
        $('.variable_price').text("¥ "+variable_price);
        $('.reservation_new__result').removeClass('removed');
        $('#rotate').removeClass('fa-angle-up');
        $('#rotate').addClass('fa-angle-down');
        $('#select-guests-num').css('visibility','hidden');
      })
      .fail(function() {
        alert('料金計算に失敗しました');
      })
    }
    else {
      return false
    }
    return false
  }
  // //料金計算
  $('.calc-listner').change(function(){
    calc_prices();
  });

});//一番上のfunction閉じ
