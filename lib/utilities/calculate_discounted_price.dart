num getDiscountedPrice({required num discount , required num price }){
  if(discount > 0){
    return (price - (price * (discount/100))).toDouble();
  }else{
    return price;
  }
}