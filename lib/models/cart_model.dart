import 'package:phuoc_duc_baithi/models/product_cart_model.dart';

class CartModel {
  int? id;
  int? userId;
  String? date;
  ProductCartModel? productCartModel;
  CartModel({this.id, this.userId, this.date, this.productCartModel});
  factory CartModel.fromJson(
      Map<String, dynamic> obj, ProductCartModel productCartModel) {
    return CartModel(
      id: obj["id"],
      userId: obj['userId'],
      date: obj['title'],
      productCartModel: productCartModel,
    );
  }
}
