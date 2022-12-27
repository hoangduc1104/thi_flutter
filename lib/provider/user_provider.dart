import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/user.dart';
import 'package:phuoc_duc_baithi/models/user_model.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart'
    as product_service;
import 'package:phuoc_duc_baithi/token/token.dart';

class UserProvider extends ChangeNotifier {
  UserModel user = new UserModel(email: '', name: '', id: '', phone: '');
  void getMe() async {
    String apiUrl = product_service.ProductService.GetMe;

    var client = http.Client();
    var jsonString = await client.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + await (new Token()).readToken()
      },
    );
    var obj = jsonDecode(jsonString.body)['user'];
    user.id = obj['_id'];
    user.email = obj['email'];
    user.name = obj['name'];
    user.phone = obj['phone'];

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
