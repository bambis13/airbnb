$(function(){
  $('.listing-slick').slick({
      accessibility: true,
      infinite: true,
      fade: true,
      dots:true,
      slidesToShow: 1,
      slidesToScroll: 1,
    });
  $('.tag-slick').slick({
      accessibility: true,
      slidesToShow: 5,
      slidesToScroll: 1,
  });
});

