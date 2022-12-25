import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> list = [];
  bool showGrid = true;
  void show(bool isGrid) {
    showGrid = isGrid;
    notifyListeners();
  }

  // void getList() async {
  //   String apiURL = 'https://fakestoreapi.com/products';
  //   var client = http.Client();
  //   var rs = await client.get(Uri.parse(apiURL));
  //   var jsonString = rs.body;
  //   var jsonObject = jsonDecode(jsonString) as List;
  //   list = jsonObject.map((e) {
  //     return CartModel.fromJson(e);
  //   }).toList();
  //   notifyListeners();
  // }
}
