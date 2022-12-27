import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phuoc_duc_baithi/models/addtocart_model.dart';
import 'package:phuoc_duc_baithi/models/product_cart_model.dart';

import 'package:phuoc_duc_baithi/models/product_model.dart';
import 'package:phuoc_duc_baithi/pages/CartPage.dart';
import 'package:phuoc_duc_baithi/pages/ItemPage.dart';
import 'package:phuoc_duc_baithi/provider/cart_provider.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart';
import 'package:phuoc_duc_baithi/token/token.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({required this.item});

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemPage(item: item)));
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "-50%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                )
              ],
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                    "http://localhost:3030/" + item.productImage.toString(),
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                item.name.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "porttitor id consequat in consequat ut nulla sed accumsan felis",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$" + item.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String apiURL = ProductService.addToCart;
                        var client = http.Client();
                        List<ProductCartModel> list = [];
                        var product = ProductCartModel.fromJson({
                          'productId': item.id,
                          'quantity': 1,
                          'price': item.price,
                        });
                        list.add(product);
                        var test = new AddToCartModel(
                            firstName: "abc",
                            lastName: "abc",
                            address: "abc",
                            products: list);
                        var body = test;
                        var addtocart = await client.post(Uri.parse(apiURL),
                            headers: {
                              'Accept': 'application/json',
                              'Authorization':
                                  'Bearer ' + await (new Token()).readToken()
                            },
                            body: test.toJson());

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartPage()),
                        );
                      },
                      child: Icon(
                        Icons.shopping_cart_checkout,
                        color: Color(0xFF4C53A5),
                      ))
                ],
              ),
            ),
          ]),
        ));
  }
}
