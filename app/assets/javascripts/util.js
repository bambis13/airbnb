function currency(amount){
  price = amount.toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
  return "¥ "+price;
}

function staydays(days){
  return days+"泊";
}

function buildGuestsNum(i, num){
  if(i == 0){
    return "ゲスト"+num+"人";
  }else if(i == 1){
    return ", 子ども"+num+"人";
  }else if(i == 2){
    return ", 乳幼児"+num+"人";
  }
}

function buildNewGuestsNum(i, num){
  if(i == 1){
    return "<p class=\"form-text-children\">, 子ども1人</p>";
  }else if(i == 2){
    return"<p class=\"form-text-babies\">, 乳幼児1人</p>"
  }
}

function buildDateString(date){
  var dtYear = date.getFullYear().toString();
  var dtMonth = date.getMonth() + 1;
  var dtDay = date.getDate();
  if (dtMonth < 10){
    dtMonth = "0"+dtMonth.toString();
  }else{
    dtMonth = dtMonth.toString();
  }
  if (dtDay < 10){
    dtDay = "0"+dtDay.toString();
  }else{
    dtDay = dtDay.toString();
  }
  return dtYear +"/"+ dtMonth +"/"+ dtDay;
}

function getId(){
  return parseInt(location.pathname.split('/')[2]);
}
