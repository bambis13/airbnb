$(function() {
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

$(function() {
  $('#show-modal').click(function() {
    $('.photo-modal-wrapper').fadeIn();
  });
  $(document).click(function(e) {
    if(e.srcElement.id!=='#modal'){
      $('#modal').fadeOut();
      }
    });
});

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
