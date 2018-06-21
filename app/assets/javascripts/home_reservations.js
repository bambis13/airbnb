$(function(){
  //人数選択フィールド出現
  $('#guests-num-btn').on('click',function(){
    $('#rotate').removeClass('fa-angle-down');
    $('#rotate').addClass('fa-angle-up');
    $('#select-guests-num').css('visibility','visible');

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
        // $('.form-text-children').remove();
        // $('.form-texts').append("<p class=\"form-text-children\">, 子ども" + countChildren + "人</p>");
      }else{
        countChildren += 1;
        $('input:hidden[name="number-of-children-sa"]').val(countChildren);
        $('.number-of-children-html').text(countChildren);
        $('.form-text-children').text(", 子ども" + countChildren + "人");
        // $('.form-text-children').remove();
        // $('.form-texts').append("<p class=\"form-text-children\">, 子ども" + countChildren + "人</p>");
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
      // $('.form-text-children').remove();
      // $('.form-texts').append("<p class=\"form-text-children\">, 子ども" + countChildren + "人</p>");
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
  });//人数選択フィールド閉じ

  //フィールド閉じる
  $('.close-button').on('click',function(e){
    e.preventDefault();
    $('#rotate').removeClass('fa-angle-up');
    $('#rotate').addClass('fa-angle-down');
    $('#select-guests-num').css('visibility','hidden');
  });

  //料金計算
  $("input[type='text']").change(function(){
    var checkin = Date.parse($('.reservation-checkin').val());
    var checkout = Date.parse($('.reservation-checkout').val());
    days = (checkout - checkin)/1000/60/60/24;
    var defaultFee = $('input:hidden[name="default_fee"]').val();
    var additionalFee = $('input:hidden[name="additional_guests_fee"]').val();
    var cleaningFee = $('input:hidden[name="cleaning_fee"]').val();
    var serviceFee = $('input:hidden[name="service_fee"]').val();
    var totalFee = (defaultFee * days)+ cleaningFee + serviceFee
    var additionalFeeFrom = $('.additional_fee_from').val();
  });

});//一番上のfunction閉じ
