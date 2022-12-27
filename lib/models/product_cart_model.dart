class ProductCartModel {
  String? productId;
  int? quantity;
  int? price;
  ProductCartModel({this.productId, this.quantity, this.price});
  factory ProductCartModel.fromJson(Map<String, dynamic> obj) {
    return ProductCartModel(
      productId: obj["productId"],
      quantity: obj['quantity'],
      price: obj['price'],
    );
  }
  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
        'price': price,
      };
}
