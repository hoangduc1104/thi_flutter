import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/product_model.dart';
import 'package:phuoc_duc_baithi/token/token.dart';

class ApiClient {
  final client = http.Client();

  Future<String> getToken(
      {required String email, required String password}) async {
    var url = Uri.parse('http://localhost:3030/api/users/login');
    var response = await client.post(url,
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    client.close();

    final token = jsonDecode(response.body);
    return token['token'];
  }

  Future<void> register(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    var url = Uri.parse('http://localhost:3030/api/users/signup');
    var response = await client.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password
    });
    client.close();

    final token = jsonDecode(response.body);
    print(token);
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

  void updateUser(
      {required String name,
      required String email,
      required String phone}) async {
    var url = Uri.parse('http://localhost:3030/api/users/me');
    var response = await client.put(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await (new Token()).readToken()
    }, body: {
      'name': name,
      'phone': phone,
      'email': email
    });
    client.close();
  }

  void changePassword(
      {required String oldpassword, required String newPassword}) async {
    var url = Uri.parse('http://localhost:3030/api/users/me/password');
    var response = await client.patch(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + await (new Token()).readToken()
    }, body: {
      "oldPassword": oldpassword,
      "newPassword": newPassword
    });
    client.close();
  }
}
