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
