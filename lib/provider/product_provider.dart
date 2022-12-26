import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:phuoc_duc_baithi/models/category_model.dart';
import 'package:phuoc_duc_baithi/models/product_model.dart';
import 'package:phuoc_duc_baithi/models/rating_model.dart';
import 'package:phuoc_duc_baithi/provider/category_provider.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart'
    as product_service;
import 'package:phuoc_duc_baithi/token/token.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> list = [];

  void getList(String category, String keyword) async {
    String apiUrl = category == "All" || category == ""
        ? product_service.ProductService.GetListProduct2
        : product_service.ProductService.GetProductByCategory + category;
    var client = http.Client();
    var jsonString = await client.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + await (new Token()).readToken()
      },
    );
    var jsonObject = jsonDecode(jsonString.body)['products'] as List;

    if (keyword == "" && keyword.isEmpty) {
      list = jsonObject.map((e) {
        var category = e['category'];
        var cate = CategoryModel.fromJson(category);
        return ProductModel.fromJson(e, cate);
      }).toList();
    }
    if (keyword != "" && keyword.isNotEmpty) {
      var listSearch = jsonObject.map((e) {
        var category = e['category'];
        var cate = CategoryModel.fromJson(category);
        return ProductModel.fromJson(e, cate);
      }).toList();
      List<ProductModel> result = [];
      for (int i = 0; i < listSearch.length; i++) {
        var item = listSearch[i];
        final check = item.name?.toLowerCase().contains(keyword.toLowerCase());

        if (check ?? false) {
          result.add(item);
        }
      }
      list = result;
    }
    notifyListeners();
  }
}
