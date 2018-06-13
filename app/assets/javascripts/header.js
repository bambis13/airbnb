$(function(){
  CategoryHTML = `<div class="search">
                    <ul class="category clearfix">
                      <span class="category__title bold">Airbnbで探す</span>
                      <li class="category__tag">
                        <a href="/" class="category__tag__link bold">すべて</a>
                      </li>
                      <li class="category__tag">
                        <a href="/" class="category__tag__link bold">宿泊先</a>
                      </li>
                      <li class="category__tag">
                        <a href="/" class="category__tag__link bold">体験</a>
                      </li>
                    </ul>
                    <ul class="recentry_search">
                      <span class="category__title bold">最近の検索</span>
                    </ul>
                  </div>`

  var searchField = $('#search-field')
  searchField.on('click', function(){
    $('.navibar__search').append(CategoryHTML)
    var input = searchField.val()
  });
  $(document).on('click', function(e){
     if (!$(event.target).closest('#search-field').length){
      $('.search').hide();
    };
  });

  var navibarListContent = $('.navibar__list__content')
  var hideContent = $('.navigation')
  navibarListContent.on('click', function(){
    hideContent.addClass('hide'); //一度全てのhideContentにhideクラスを追加
    $('.navigation', this).removeClass('hide');
    return false
  });
  $(document).on('click', function(e){
    if (!$(event.target).closest(navibarListContent).length || $('#help-non-login').click()){
      hideContent.addClass('hide');
      return false
    };
  });
  $('.help__head__close').on('click', function(){
    hideContent.addClass('hide');
    return false
  })
});
