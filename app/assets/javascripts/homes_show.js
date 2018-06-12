$(function () {
  // 続きを読むボタン
  $('.readmore-item-space').readmore({
    speed: 700,
    collapsedHeight: 200,
    moreLink: '<a href="#, class="collapse-btn-1">続きを読む ↓</a>',
    lessLink: '<a href="#", class="collapse-btn-2">閉じる　↑</a>'
  });

  $('.readmore-item-map').readmore({
    speed: 700,
    collapsedHeight: 100,
    moreLink: '<a href="#, class="collapse-btn-1">このエリア情報の続きを読む ↓</a>',
    lessLink: '<a href="#", class="collapse-btn-2">非表示にする　↑</a>'
  });

  $('.readmore-item-house-rule').readmore({
    speed: 700,
    collapsedHeight: 200,
    moreLink: '<a href="#, class="collapse-btn-1">全ルールを読む ↓</a>',
    lessLink: '<a href="#", class="collapse-btn-2">ルールを非表示にする　↑</a>'
  });
});

$(function() {
    var topBtn = $('#header_show');
    var originalHeader = $('#hide-header');
    topBtn.hide();
    //スクロールが100に達したらボタン表示
    $('.contents').scroll(function () {
        if ($('.contents').scrollTop() > 500) {
        //ボタンの表示方法
            originalHeader.hide();
            topBtn.show();
        } else {
        //ボタンの非表示方法
            topBtn.hide();
            originalHeader.show();
        }
    });
    //スクロールしてトップ
    topBtn.click(function () {
        $('.contents').animate({
            scrollTop: 0
        },   500);
        return false;
    });

    $("#header_show a").click(function(){
      // var headerHeight = $('#header_show').height();
      // var imageHeight = $('.header-img').height();
      var id = $(this).attr("href");
      console.log(id)
      var position = $(id).offset().top;
      console.log(position)
      $('.contents').animate({
        "scrollTop":position
      }, 500);
    });

// var id = $(this).offset().top;

// $('.contents').scroll(function() {
//     var scroll = $(this).scrollTop();

//     if( scroll >= id) {
//         console.log('h1要素が画面の一番上に来ました！');
//     }
// })
});

  // $('header a').click(function(){
  //   var id = $(this).attr('href');
  //   var position = $(id).offset().top;
  //   $('.contents').animate({
  //     'scrollTop': position
  //   }, 500);
  // });




















