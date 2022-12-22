import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/pages/item_detail/product_detail.dart';
// import 'package:flutter_wanna_shop/domain/entity/products.dart';
// import 'package:flutter_wanna_shop/pages/item_detail/product_detail.dart';

class ProductsGrid extends StatelessWidget {
  final List<dynamic> productitem;
  const ProductsGrid({Key? key, required this.productitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          mainAxisExtent: 240,
          mainAxisSpacing: 20,
        ),
        itemCount: productitem.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(
                            id: productitem[index].id,
                            name: productitem[index].name,
                            price: productitem[index].price,
                            description: productitem[index].description,
                            images: productitem[index].image,
                          )));
            },
            child: Container(
              width: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    width: 120,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(productitem[index].image[0]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 16, 18, 8),
                    child: Text(
                      productitem[index].name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text('\$${productitem[index].price}',
                        style: TextStyle(fontSize: 18)),
                  )
                ],
              ),
            ),
          );
        });
  }
}
