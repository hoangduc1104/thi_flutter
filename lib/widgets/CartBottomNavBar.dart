import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:phuoc_duc_baithi/provider/cart_provider.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart';
import 'package:phuoc_duc_baithi/token/token.dart';
import 'package:provider/provider.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    Key? key,
    required this.tongtien,
  }) : super(key: key);
  final int tongtien;

  @override
  Widget build(BuildContext context) {
    var cartprovider = Provider.of<CartProvider>(context);

    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      color: Color(0xFF4C53A5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$" + tongtien.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)),
                )
              ],
            ),
            Container(
                height: 50,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    String apiURL = ProductService.checkout;
                    var client = http.Client();
                    var checkout =
                        await client.put(Uri.parse(apiURL), headers: {
                      'Accept': 'application/json',
                      'Authorization':
                          'Bearer ' + await (new Token()).readToken()
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Check out success')));
                    cartprovider.getList();
                  },
                  child: Text(
                    "Check out",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
