import 'package:shop_flow/core/data/product_detail_modal.dart';

Map<String , num> calculateCheckoutData(List<ProductDetailModal> cartItemList){
  Map<String , num> finalData = {
    "subtotal" : 0,
    "discount" : 0,
    "total" : 0,
  };
  for (var item in cartItemList) {
    finalData['subtotal'] = (finalData['subtotal'] ?? 0) + ((item.price ?? 0) * (item.quantity ?? 0 ));
    finalData['discount'] = (finalData['discount'] ?? 0) + (((item.price ?? 0) * (item.quantity ?? 0)) *
        (item.discount ?? 0) / 100);

    print("subtotal ${finalData['subtotal']} discount ${finalData['discount']}");
  }
  finalData["total"] = (finalData["subtotal"] ?? 0) - (finalData["discount"] ?? 0);

  return finalData;
}