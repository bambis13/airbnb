// const API_KEY = '<%=google_api_key%>';

// $(function () {
// $(document).on("load", function() {
//     var building    = `${home.building}`
//     var street      = `${home.street}`
//     var town        = `${home.town}`
//     var prefecture  = `${home.prefecture}`
//     var requestUrl  = 'https://maps.googleapis.com/maps/api/geocode/json?address='
//     var requestUrl  += building '+' + street + '+' + town + '+' + 'prefecture' + '&key=' + API_KEY;

//     $.ajax(requestUrl)
//     .done(function(data){
//       // console.log(data)
//     //   function initMap() {
//     //     var test ={lat: #{@home.location_x}, lng: #{@home.location_y}};
//     //     var map = new google.maps.Map(document.getElementById('map'), {
//     //         zoom: 15,
//     //         center: test
//     //     });
//     //     var transitLayer = new google.maps.TransitLayer();
//     //     transitLayer.setMap(map);

//     //     var contentString = '住所：#{@home.town}';
//     //     var infowindow = new google.maps.InfoWindow({
//     //         content: contentString
//     //     });

//     //     var marker = new google.maps.Marker({
//     //         position:test,
//     //         map: map,
//     //         title: contentString
//     //     });

//     //     marker.addListener('click', function() {
//     //         infowindow.open(map, marker);
//     //     });
//     // }
//     //   })
//     .fail(function(data){
//       alert("ユーザー検索に失敗しました");
//     })
//   })
// });


