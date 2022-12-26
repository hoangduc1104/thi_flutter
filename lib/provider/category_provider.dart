import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/category_model.dart';
// import 'package:phuoc_duc_baithi/service/auth_service.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart'
    as product_service;

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> list = [];

  void getList() async {
    String apiUrl = product_service.ProductService.GetListCategory;

    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body)['categories'] as List;

    list = jsonObject.map((e) => CategoryModel.fromJson(e)).toList();
    // CategoryModel all =
    String allObj = '{"_id":"0","name":"All","__v":0}';
    CategoryModel allcate = CategoryModel.fromJson(jsonDecode(allObj));
    // list.add(allcate);
    list.insert(0, allcate);
    notifyListeners();
  }
}
// class CategoryProvider extends ChangeNotifier {
//   List<dynamic> list = [];

//   void getList() async {
//     String apiUrl = product_service.ProductService.GetListCategory;

//     var client = http.Client();
//     var jsonString = await client.get(Uri.parse(apiUrl));
//     var jsonObject = jsonDecode(jsonString.body);

//     list = jsonObject;
//     list.insert(0, "All");
//     notifyListeners();
//   }
// }
