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
  $('.tag-slick').slick({
      accessibility: true,
      slidesToShow: 5,
      slidesToScroll: 1,
  });
});

