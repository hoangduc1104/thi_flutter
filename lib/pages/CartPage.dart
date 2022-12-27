import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/provider/cart_provider.dart';
import 'package:phuoc_duc_baithi/widgets/CartAppBar.dart';
import 'package:phuoc_duc_baithi/widgets/CartBottomNavBar.dart';
import 'package:phuoc_duc_baithi/widgets/CartItem.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    var cartprovider = Provider.of<CartProvider>(context, listen: false);
    cartprovider.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cartprovider = Provider.of<CartProvider>(context);
    int tongtien = 0;

    for (var element in cartprovider.list) {
      tongtien = tongtien + element.price! * element.quantity!;
    }

    return Scaffold(
      body: Scaffold(
        body: ListView(
          children: [
            CartAppBar(),
            Container(
              height: 1000,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  CartItem(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Add Coupon Code",
                            style: TextStyle(
                                color: Color(0xFF4C53A5),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: CartBottomNavBar(
          tongtien: tongtien,
        ),
      ),
    );
  }
}
