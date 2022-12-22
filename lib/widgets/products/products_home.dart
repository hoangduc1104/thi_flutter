import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/domain/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/domain/entity/products.dart';
import 'package:phuoc_duc_baithi/widgets/products/product_home_page.dart';

class ProductsHome extends StatefulWidget {
  const ProductsHome({Key? key}) : super(key: key);

  @override
  _ProductsHomeState createState() => _ProductsHomeState();
}

class _ProductsHomeState extends State<ProductsHome> {
  late List<ProductItem> _productitem;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProd();
  }

  Future<void> getProd() async {
    _productitem = await ApiClient().getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ProductsGrid(productitem: _productitem);
  }
}
