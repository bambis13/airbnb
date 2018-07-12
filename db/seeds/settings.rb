  language_list = ["日本語","英語","中国語","フランス語","イタリア語","スペイン語","ロシア語","韓国語"]
  language_list.length.times do |i|
    Language.create(
      name: language_list[i]
    )
  end

  currencies_list = ["USD","JPY","EUR","GBP","CHF","CAD","MXN","KRW","CNY","AUD","TRY","BRL","HKD","THB","PHP","VND","MYR","TWD","RUB","EGP"]
  currencies_list.length.times do |i|
    Currency.create(
      name: currencies_list[i]
    )
  end

  country_list = ["日本","アメリカ","フランス","イギリス","韓国","イタリア","オーストラリア","ドイツ","台湾","シンガポール","タイ","フィリピン","マレーシア","中国","ベトナム","インドネシア","マカオ","スイス","カナダ","インド","トルコ","カンボジア","チェコ","クロアチア","オランダ","ベルギー","フィンランド","ロシア","メキシコ","ブラジル","ポルトガル","スウェーデン","ペルー","パラオ","エジプト","南アフリカ共和国","マダガスカル"]

  country_list.length.times do |i|
    Country.create(
      name: country_list[i]
    )
  end

  room_type_list = ["個室","シェアハウス"]
  room_type_list.length.times do |i|
    RoomType.create(
      name: room_type_list[i]
    )
  end

  home_category_main_list = ["マンション・アパート","住宅","サブユニット","ユニークな施設","B&B","デザイナーズホテル・その他"]
  home_category_main_list.length.times do |i|
    HomeCategoryMain.create(
      name: home_category_main_list[i]
    )
  end

  home_category_sub_list = ["マンション・アパート","コンドミニアム","ロフト","マンスリー・サービスアパートメント","一軒家","バンガロー","ログハウス","カーサ・パルティクラル","シャレー","コテージ","ドームハウス","土の家","農家民泊","ハウスボート","古民家","灯台","ペンション","羊飼いの小屋","タイニーハウス","タウンハウス","トルッロ","ヴィラ","納屋","ボート&船舶","バス","キャンピングカー","キャンブ場","城","洞窟","ドームハウス","ハウスボート","かまくら","島","飛行機","テント","電車","風車小屋","ユルト","デザイナーズホテル","旅館","ビジネスホテル","リゾートホテル"]
  home_category_sub_list.length.times do |i|
    HomeCategorySub.create(
      name: home_category_sub_list[i]
    )
    HomeCategoryMainSub.create(
      home_category_sub_id: i+1,
      home_category_main_id: rand(1..6)
    )
  end
