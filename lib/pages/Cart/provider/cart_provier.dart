import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:phuoc_duc_baithi/domain/api_clients/api_client.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> _products = [];
  bool _isLoading = true;

  List<dynamic> get products => _products;
  bool get isLoading => _isLoading;

  CartProvider() {
    initProducts();
  }

  void initProducts() async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    if (token != null) {
      _products = await ApiClient().readCart(token: token);
      _isLoading = false;
    }
    notifyListeners();
  }

  void deleteProduct(int id, dynamic item) async {
    var box = await Hive.openBox('tokenBox');
    var token = box.get('token');
    if (token != null) {
      ApiClient().deleteItemCart(token: token, id: id);
      _products.remove(item);
    }
    notifyListeners();
  }
}
