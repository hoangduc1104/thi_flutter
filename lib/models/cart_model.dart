import 'package:phuoc_duc_baithi/models/product_cart_model.dart';
import 'package:phuoc_duc_baithi/models/product_model.dart';
import 'package:phuoc_duc_baithi/models/user.dart';

class CartModel {
  ProductModel? productModel;
  User? user;
  int? price;
  int? quantity;
  String? id;

  CartModel({this.productModel, this.user, this.price, this.quantity, this.id});
  factory CartModel.fromJson(
      Map<String, dynamic> obj, User user, ProductModel productmodel) {
    return CartModel(
        user: user,
        price: obj['price'],
        productModel: productmodel,
        quantity: obj['quantity'],
        id: obj['_id']);
  }
}
