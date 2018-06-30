$(function(){
  function getLatLng(searchElement) {
    $.ajax({
      type : 'get',
      url : 'https://maps.googleapis.com/maps/api/geocode/json',
      crossDomain : true,
      dataType : 'json',
      data : {
        address : searchElement,
        language : 'ja',
        sensor : false
      },
      success : function(resp){
        if(resp.status == "OK"){
          // APIのレスポンスから住所情報を取得
          var obj = resp.results[0].address_components;
          var location =resp.results[0].geometry.location;
          if(obj.length > 5){
          $('#prefecture').val(obj[3]['long_name']); // 都道府県
          $('#town').val(obj[2]['long_name']);  // 市区町村
          $('#street1').val(obj[1]['long_name'] + obj[0]['long_name']); // 番地
          $('#lat').val(location['lat']);
          $('#lon').val(location['lng']);
          }else if(obj.length = 5){
          $('#prefecture').val(obj[3]['long_name']); // 都道府県
          $('#town').val(obj[2]['long_name']);  // 市区町村
          $('#street1').val(obj[1]['long_name']); // 番地
          $('#lat').val(location['lat']);
          $('#lon').val(location['lng']);
          }else{
            alert('正しい郵便番号を入力してください');
            return false;
          }
        }else{
          alert('住所情報が取得できませんでした');
          return false;
        }
      }
    });
  }
  var zipBtn = $('.zip_btn');
  var targetEvent = $('.create_btn')
  var zip = $('#zip');

  zipBtn.on('click', function(){
    getLatLng(zip.val());
  });
  targetEvent.on('click',function(){
    var address = $('#prefecture').val() + $('#town').val() + $('#street1').val();
    getLatLng(address);
  });
});
