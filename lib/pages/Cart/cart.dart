import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/pages/Cart/provider/cart_provier.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: _CartItem(),
      ),
    );
  }
}

class _CartItem extends StatefulWidget {
  const _CartItem({Key? key}) : super(key: key);

  @override
  __CartItemState createState() => __CartItemState();
}

class __CartItemState extends State<_CartItem> {
  @override
  Widget build(BuildContext context) {
    return context.watch<CartProvider>().isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.watch<CartProvider>().products.length,
                    itemBuilder: (BuildContext context, int index) {
                      var _currentProduct =
                          context.watch<CartProvider>().products[index];
                      var _currentImage = [];
                      context
                          .watch<CartProvider>()
                          .products[index]
                          .image
                          .map((e) {
                        if (e.indexOf('01') != -1) _currentImage.add(e);
                      }).toList();
                      return _ProductDescription(
                          index: index,
                          id: _currentProduct.id,
                          name: _currentProduct.name,
                          price: _currentProduct.price,
                          image: _currentImage[0]);
                    }),
              )),
              _Info()
            ],
          );
  }
}

class _ProductDescription extends StatelessWidget {
  final int index;
  final int id;
  final String name;
  final double price;
  final String image;
  const _ProductDescription(
      {Key? key,
      required this.index,
      required this.id,
      required this.name,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          margin: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 120,
                    height: 126,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name),
                        Text(
                          'Price: \$$price',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                        Text('Size: Large',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Text('Color: Black',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 22,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  context.read<CartProvider>().deleteProduct(
                      id, context.read<CartProvider>().products[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 4),
                  child: Icon(Icons.delete_outline_outlined),
                ),
              )
            ],
          ),
        ));
  }
}

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _totalPrice = 0.0;
    context.watch<CartProvider>().products.forEach((element) {
      _totalPrice = _totalPrice + element.price;
    });
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: 200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$$_totalPrice',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VAT', style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$20',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$50',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub Total',
                  style: TextStyle(color: Colors.grey, fontSize: 14)),
              Text('\$${_totalPrice + 70}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(255, 185, 5, 1)),
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Proceed to checkout',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
