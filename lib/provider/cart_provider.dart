import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/cart_model.dart';
import 'package:phuoc_duc_baithi/models/category_model.dart';
import 'package:phuoc_duc_baithi/models/product_model.dart';
import 'package:phuoc_duc_baithi/models/user.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart';
import 'package:phuoc_duc_baithi/token/token.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> list = [];
  bool showGrid = true;
  void show(bool isGrid) {
    showGrid = isGrid;
    notifyListeners();
  }

  void getList() async {
    String apiURL = ProductService.GetorderbyUser;
    var client = http.Client();
    var rs = await client.get(
      Uri.parse(apiURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + await (new Token()).readToken()
      },
    );
    var jsonString = rs.body;
    var jsonObject = jsonDecode(jsonString)['orders'] as List;

    list = jsonObject.map((e) {
      var category = e['product']['category'];
      var cate = CategoryModel.fromJson(category);
      var product = e['product'];
      var pro = ProductModel.fromJson(product, cate);
      var user = e['user'];
      var u = User.fromJson(user);
      return CartModel.fromJson(e, u, pro);
    }).toList();
    notifyListeners();
  }
}
