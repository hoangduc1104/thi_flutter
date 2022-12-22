import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/domain/entity/cart_item.dart';
import 'package:phuoc_duc_baithi/domain/entity/categories.dart';
import 'package:phuoc_duc_baithi/domain/entity/products.dart';
import 'package:phuoc_duc_baithi/domain/entity/token.dart';

class ApiClient {
  final client = http.Client();

  /*Future<dynamic> getProducts() async {
    final url = Uri.parse('https://mdatest2.herokuapp.com/api/products/');
    final request = await client.getUrl(url);
    final response = await request.close();

    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;

    final products = json
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return products;
  }*/

  Future<dynamic> getProducts() async {
    final url = Uri.parse('http://localhost:3000/api/products');
    final response = await client.get(url);
    client.close();
    final mda = response.body;

    final json = jsonDecode(mda) as List<dynamic>;

    final products = json
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();

    return products;
  }

  Future<dynamic> getCategories() async {
    final url = Uri.parse('http://localhost:3000/api/categories');
    final response = await client.get(url);
    client.close();

    final mda = response.body;
    final json = jsonDecode(mda) as List<dynamic>;

    final categories = json
        .map((e) => Categories.fromJson(e as Map<String, dynamic>))
        .toList();

    return categories;
  }

  Map<String, String> get headers => {
        // "Content-Type": "application/json",
        "Accept": "application/json",
      };

  Future<String> getToken(
      {required String email, required String password}) async {
    var url = Uri.parse('http://localhost:3000/api/users/login');
    var response = await client.post(url,
        headers: headers, body: {'email': email, 'password': password});
    client.close();

    final body = json.decode(response.body);
    // print(body["token"]);
    // final token = jsonDecode(body["token"]);
    return body["token"];
  }

  Future<int> createUser(
      {required String email,
      required String username,
      required String password}) async {
    final msg = jsonEncode(
        {'email': email, 'username': username, 'password': password});
    var url = Uri.parse('https://mdatest2.herokuapp.com/auth/users/');
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"}, body: msg);

    client.close();

    return response.statusCode;
  }

  Future<dynamic> readUser({required String token}) async {
    var url = Uri.parse('https://mdatest2.herokuapp.com/auth/users/');
    var response = await client.get(url, headers: {
      "Authorization": "Token ${token}",
    });

    client.close();

    return response.body;
  }

  Future<dynamic> addCart({required int id, required String token}) async {
    var url =
        Uri.parse('https://mdatest2.herokuapp.com/api/add_item_to_basket/');
    var body = jsonEncode({'id': id});
    var response = await client.post(url,
        headers: {
          "Authorization": "Token ${token}",
          "Content-Type": "application/json"
        },
        body: body);

    client.close();

    return response.statusCode;
  }

  Future<dynamic> readCart({required String token}) async {
    var url = Uri.parse('https://mdatest2.herokuapp.com/api/basket/');
    var response = await client.get(url, headers: {
      "Authorization": "Token ${token}",
    });

    client.close();
    final mda = jsonDecode(response.body) as Map<String, dynamic>;

    final products = mda['products']
        .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList();
    print(products);

    return products;
  }

  Future<dynamic> deleteItemCart(
      {required String token, required int id}) async {
    var url =
        Uri.parse('https://mdatest2.herokuapp.com/api/remove_item_in_basket/');
    var itemId = jsonEncode({'id': id});
    var response = await client.delete(url,
        headers: {
          "Authorization": "Token ${token}",
          "Content-Type": "application/json"
        },
        body: itemId);

    client.close();

    return response.statusCode;
  }

  Future<dynamic> getCategoryItems({required int id}) async {
    var url = Uri.parse('https://mdatest2.herokuapp.com/api/categories/$id/');
    var response = await client.get(url);

    client.close();
    final mda = jsonDecode(response.body) as Map<String, dynamic>;

    final products = mda['products']
        .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
        .toList();
    print(products);

    return products;
  }

  Future<int> logout({
    required String token,
  }) async {
    var url = Uri.parse('https://mdatest2.herokuapp.com/api/logout/');
    var response = await client.get(url, headers: {
      "Authorization": "Token ${token}",
    });

    client.close();

    return response.statusCode;
  }
}
