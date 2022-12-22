import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Adidas Human Race',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '\$280',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Choose Size',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              _Size(size: "S"),
              _Size(size: "M"),
              _Size(size: "M"),
              _Size(size: "XL"),
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Text('Detail',
              style: TextStyle(fontSize: 18, color: Colors.grey[600])),
          SizedBox(
            height: 7,
          ),
          Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]))
        ],
      ),
    );
  }
}

class _Size extends StatelessWidget {
  final String size;
  const _Size({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: 40,
      height: 40,
      child: Text(
        size,
        style: TextStyle(fontSize: 24, color: Colors.grey),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
