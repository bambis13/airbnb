$(function(){
  function initialize() {
    // 地図を表示する際のオプションを設定
    var mapOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    // Mapオブジェクトに地図表示要素情報とオプション情報を渡し、インスタンス生成
    var map = new google.maps.Map(document.getElementById("map"),
        mapOptions);
  }


  var zip_btn = $('.zip_btn');
  var zip = $('#zip');


  zip_btn.on('click', function(){
    console.log(zip.val())
    $.ajax({
      type : 'get',
      url : 'https://maps.googleapis.com/maps/api/geocode/json',
      crossDomain : true,
      dataType : 'json',
      data : {
        address : zip.val(),
        language : 'ja',
        sensor : false
      },
      success : function(resp){
        if(resp.status == "OK"){
          // APIのレスポンスから住所情報を取得
          console.log(resp)
          var obj = resp.results[0].address_components;
          var location =resp.results[0].geometry.location;
          console.log(location['lat']);
          if (obj.length < 5) {
            alert('正しい郵便番号を入力してください');
            return false;
          }
          //$('#country').val(obj[4]['long_name']); // 国
          $('#state').val(obj[3]['long_name']); // 都道府県
          $('#town').val(obj[2]['long_name']);  // 市区町村
          $('#street1').val(obj[1]['long_name']); // 番地
          $('#lat').val(location['lat']);
          $('#lon').val(location['lng']);
        }else{
          alert('住所情報が取得できませんでした');
          return false;
        }
      }
    });
  })
})
