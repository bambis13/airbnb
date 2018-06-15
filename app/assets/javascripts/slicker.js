$(function(){

  $('.listing-slick').hover(
    function(){
      $(this).children('.slick-arrow').css("visibility", "visible");
    },
    function(){
      $(this).children('.slick-arrow').css("visibility", "hidden");
    }
  );
  $('.listing-slick').slick({
      accessibility: true,
      infinite: true,
      fade: true,
      dots:true,
      slidesToShow: 1,
      slidesToScroll: 1,
     });
});

//複数枚表示
$(function() {
  $('.listing-slick-2').slick({
      accessibility: true,
      infinite: true,
      fade: false,
      slidesToShow: 2,
      slidesToScroll: 1,
      adaptiveHeight: true,
      autoplay:true,
  });
});

//モーダル表示
$(function() {
  $('#show-modal').click(function() {
    $('.photo-modal-wrapper').fadeIn();
  });
  $(".close-modal").on("click", function() {
    $('.photo-modal-wrapper').fadeOut();
    });
  $('.tag-slick').slick({
      accessibility: true,
      slidesToShow: 5,
      slidesToScroll: 1,
  });
});

//homes_showのトップ画面モーダル制御
$(function() {
  $('.listing-slick-3').slick({
      accessibility: true,
      // asNavFor:'.listing-slick-3',
      infinite: true,
      fade: false,
      slidesToShow: 1,
      slidesToScroll: 1,
      dots: true,
      autoplay:true,
      asNavFor: '.thumnail-list'
  });
  $('.thumnail-list').slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 400,
    arrows: true,
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    asNavFor: '.listing-slick-3',
    focusOnSelect: true,
  });
});


