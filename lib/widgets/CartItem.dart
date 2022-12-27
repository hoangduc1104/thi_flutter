import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:phuoc_duc_baithi/provider/cart_provider.dart';
import 'package:phuoc_duc_baithi/service/product_service.dart';
import 'package:phuoc_duc_baithi/token/token.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  State<CartItem> createState() => _CartPageState();
}

class _CartPageState extends State<CartItem> {
  @override
  void initState() {
    super.initState();
    var cartprovider = Provider.of<CartProvider>(context, listen: false);
    cartprovider.getList();
  }

  @override
  Widget build(BuildContext context) {
    var cartprovider = Provider.of<CartProvider>(context);

    return Scrollbar(
      child: Column(
        children: [
          ...cartprovider.list.map(
            (e) {
              return Container(
                height: 110,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.network("http://localhost:3030/" +
                          e.productModel!.productImage!),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                e.productModel!.name!.toString(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4C53A5)),
                              ),
                            ),
                            Text(
                              "\$" + e.price.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(0)),
                            ),
                            onPressed: () async {
                              String apiURL = ProductService.DeleteCart + e.id!;
                              var client = http.Client();
                              var delete = await client.delete(
                                Uri.parse(apiURL),
                                headers: {
                                  'Accept': 'application/json',
                                  'Authorization': 'Bearer ' +
                                      await (new Token()).readToken()
                                },
                              );
                              cartprovider.getList();
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 15,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  e.quantity!.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      size: 18,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
