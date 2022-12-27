import 'dart:convert';

import 'package:phuoc_duc_baithi/models/product_cart_model.dart';

class AddToCartModel {
  List<ProductCartModel> products;
  String? firstName;
  String? lastName;
  String? address;

  AddToCartModel(
      {required this.products, this.firstName, this.lastName, this.address});
  factory AddToCartModel.fromJson(
      Map<String, dynamic> obj, List<ProductCartModel> productcartmodel) {
    return AddToCartModel(
      firstName: obj['firstName'],
      lastName: obj['lastName'],
      products: productcartmodel,
      address: obj['address'],
    );
  }
  dynamic ditmecuocdoi() {
    List<dynamic> list = [];
    for (var e in products) {
      list.add(e.toJson());
      print(e.toJson());
    }

    return list;
  }

  Map<dynamic, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'products': json.encode(ditmecuocdoi())
      };
}
