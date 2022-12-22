import 'package:flutter/cupertino.dart';
import 'package:phuoc_duc_baithi/domain/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/domain/entity/products.dart';

class ProductChangeModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _products = <ProductItem>[];
  List<ProductItem> get products => _products;

  Future<void> reloadProducts() async {
    final products = await apiClient.getProducts();
    _products = products;
    notifyListeners();
  }
}

class ProductModelProvider extends InheritedNotifier {
  final ProductChangeModel model;
  const ProductModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static ProductModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductModelProvider>();
  }

  static ProductModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ProductModelProvider>()
        ?.widget;
    return widget is ProductModelProvider ? widget : null;
  }
}
