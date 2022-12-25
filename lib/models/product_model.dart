import 'package:phuoc_duc_baithi/models/category_model.dart';
import 'package:phuoc_duc_baithi/models/rating_model.dart';

class ProductModel {
  String? id;
  String? name;
  double? price;
  String? description;
  CategoryModel? category;
  String? productImage;
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.category,
    this.productImage,
  });
  factory ProductModel.fromJson(Map<String, dynamic> obj, CategoryModel cate) {
    return ProductModel(
      id: obj["_id"],
      name: obj['name'],
      price: obj['price'].toDouble(),
      category: cate,
      productImage: obj['productImage'],
    );
  }
}
