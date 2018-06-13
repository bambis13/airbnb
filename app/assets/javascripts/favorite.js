$(function(){
  $('.favorite-btn').on('click',function(e){
    e.preventDefault();
    $(this).children('.icon-favorite-pink').css("visibility", "visible");
  });
});
