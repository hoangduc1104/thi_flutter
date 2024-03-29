import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/pages/CartPage.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4C53A5),
            )),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Fake Store",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        Spacer(),
        Container(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
        )
      ]),
    );
  }
}
