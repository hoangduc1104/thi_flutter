import 'package:phuoc_duc_baithi/models/rating_model.dart';

class CategoryModel {
  String? id;
  String? name;
  int? v;

  CategoryModel({
    this.id,
    this.name,
    this.v,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> obj) {
    return CategoryModel(
      id: obj["_id"],
      name: obj['name'],
      v: obj['__v'],
    );
  }

  toList() {}
}
