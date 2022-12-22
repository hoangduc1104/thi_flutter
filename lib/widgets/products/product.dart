/*import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top:24),
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
                  image: AssetImage('assets/images/snek1.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(17, 16, 18, 8),
            child: Text(
              'Adidas Human Race',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Text('\$280', style: TextStyle(fontSize: 18)),
          )
        ],
      ),
    );
  }
}

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

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
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Product();
        });
  }
}
*/