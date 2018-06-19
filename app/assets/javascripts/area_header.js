$(function(){
  $('.area__header__ppl__num').on('click', function(){
    console.log(2)
    $('#menuItemComponent-guest_picker').removeClass('hide');
    $('.contents').css({
      'position': 'relative',
      'height': '100vh',
      'width': '100%',
      'z-index': '100',
      'background': 'rgba(255, 255, 255, 0.85)'
    });
  })

  $(document).on('click', function(e){
     if (!$(e.target).closest('.select-capacity').length && !$(e.target).closest('.area__header__ppl__num').length){
      $('#menuItemComponent-guest_picker').hide();
    }else if($(e.target).closest('.area__header__ppl__num').length){

        if($('#menuItemComponent-guest_picker').is(':hidden')){
            $('#menuItemComponent-guest_picker').show();
        }else{
            $('#menuItemComponent-guest_picker').hide();
        }
    };
  });

  //数値取得
  $(function(){
    var countAdult    = $('.number-of-adult').attr('value');
    var countChildren = $('.number-of-children').attr('value');
    var countBabies   = $('.number-of-babies').attr('value');

      //大人
      $(".count-up-adult").click(function(e) {
        e.preventDefault();
        if (countAdult < 17){
        countAdult++;
        console.log(countAdult)
      };
      $(".number-of-adult-html").html(countAdult+"+");
      $('.number-of-adult').attr('value', countAdult);
    })
      $(".count-down-adult").click(function(e) {
        e.preventDefault();
        if (countAdult > 1){
        countAdult = countAdult - 1
      $(".number-of-adult-html").html(countAdult+"+")
      $('.number-of-adult').attr('value', countAdult);
    };
    });
      //子ども
      $(".count-up-children").click(function(e) {
        e.preventDefault();
        if (countChildren < 5){
        countChildren++;
      };
      $(".number-of-children-html").html(countChildren+"+");
      $('.number-of-children').attr('value', countChildren);
    })
      $(".count-down-children").click(function(e) {
        e.preventDefault();
        if (countChildren > 0){
        countChildren = countChildren - 1
      $(".number-of-children-html").html(countChildren+"+");
      $('.number-of-children').attr('value', countChildren);
    };
    });

      //幼児
      $(".count-up-babies").click(function(e) {
        e.preventDefault();
        if (countBabies < 5){
        countBabies++;
      };
      $(".number-of-babies-html").html(countBabies+"+");
      $('.number-of-babies').attr('value', countBabies);
    })
      $(".count-down-babies").click(function(e) {
        e.preventDefault();
        if (countBabies > 0){
        countBabies = countBabies - 1
      $(".number-of-babies-html").html(countBabies+"+");
      $('.number-of-babies').attr('value', countBabies);
    };
    });
  });
});

