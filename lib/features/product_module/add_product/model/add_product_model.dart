import 'package:flutter/material.dart';
class AddProductModel {
  List<String> productImages= [];
  String? productTitle;
  String? description;
  String? originalPrice;
  String? discount;
  String? sellingPrice;
  String? category;
  int? inventoryStock;

  final TextEditingController productTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController originalPriceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  AddProductModel({
    this.productTitle,
    this.description,
    this.originalPrice,
    this.discount,
    this.sellingPrice,
    this.category,
    this.inventoryStock = 1,
  });

  AddProductModel.fromJson(Map<String, dynamic> json) {
    productImages = json['productImages'].cast<String>();
    productTitle = json['productTitle'];
    description = json['description'];
    originalPrice = json['originalPrice'];
    discount = json['discount'];
    sellingPrice = json['sellingPrice'];
    category = json['category'];
    inventoryStock = json['inventoryStock'];
  }

  Map<String, dynamic> toJson() {
    _setData();
    final Map<String, dynamic> data = {};
    data['productImages'] = productImages;
    data['productTitle'] = productTitle;
    data['description'] = description;
    data['originalPrice'] = originalPrice;
    data['discount'] = discount;
    data['sellingPrice'] = sellingPrice;
    data['category'] = category;
    data['inventoryStock'] = inventoryStock;
    return data;
  }

  void _setData(){
    productTitle = productTitleController.text.trim();
    description = descriptionController.text.trim();
    originalPrice = originalPriceController.text.trim();
    discount = discountController.text.trim();
    category = categoryController.text.trim();
  }
}

