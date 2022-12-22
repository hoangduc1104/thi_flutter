import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/widgets/products/product_description.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> _prodImages = [
    'assets/images/snek1.jpg',
    'assets/images/snek2.jpg',
    'assets/images/snek3.jpg'
  ];

  String mda = 'assets/images/snek1.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            LimitedBox(
                maxHeight: 264,
                child: PageView.builder(
                    itemCount: _prodImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _ProductImage(img: _prodImages[index]);
                    })),
            ProductDescription(),
          ],
        ));
  }
}

class _ProductImage extends StatelessWidget {
  final String img;
  const _ProductImage({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
