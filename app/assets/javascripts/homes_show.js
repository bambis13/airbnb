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
    $("#header_show a").click(function(){
      var id = $(this).attr("href");
      var position = $(id).get( 0 ).offsetTop - 70
      $('.contents').animate({scrollTop: position}, 500)
    });
});






















