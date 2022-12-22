import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class ProductItem {
  final String _id;
  final String name;
  // final String description;
  final String price;
  final int category;
  // final List<String> image;
  final String productImage;

  ProductItem(
      this._id, this.name, this.price, this.category, this.productImage);

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
}
