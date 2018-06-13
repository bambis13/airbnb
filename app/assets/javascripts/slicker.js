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
      infinite: true,
      fade: true,
      rows: 1,
            // slidesPerRow: 1;
      slidesToShow: 4,
      slidesToScroll: 1,
  });
});

