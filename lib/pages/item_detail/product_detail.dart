import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phuoc_duc_baithi/domain/api_clients/api_client.dart';
import 'package:phuoc_duc_baithi/pages/auth/login_page.dart';

class ProductDetail extends StatelessWidget {
  final List<String> images;
  final int id;
  final String name;
  final String price;
  final String description;
  const ProductDetail(
      {Key? key,
      required this.images,
      required this.id,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _Carousel(
        images: images,
        name: name,
        price: price,
        description: description,
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          var box = await Hive.openBox('tokenBox');
          var token = box.get('token');
          if (token != null) {
            await ApiClient().addCart(id: id, token: token).then((code) {
              if (code == 200) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product Adds To Cart')));
              }
            });
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.grey[200],
        child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(255, 185, 5, 1)),
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Carousel extends StatelessWidget {
  final List<String> images;
  final String name;
  final String price;
  final String description;
  const _Carousel(
      {Key? key,
      required this.images,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

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
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _ProductImage(img: images[index]);
                    })),
            _ProductDescription(
              name: name,
              price: price,
              description: description,
            ),
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
      child: Image.network(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  const _ProductDescription(
      {Key? key,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

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
                name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '\$${price}',
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
              Expanded(
                  child: SizedBox(
                height: 50,
                child: const _CustomRadio(),
              ))
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
          Text(description,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]))
        ],
      ),
    );
  }
}

class _CustomRadio extends StatefulWidget {
  const _CustomRadio({Key? key}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<_CustomRadio> {
  List<String> _size = ['S', 'M', 'L', 'XL'];
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _customRadio(_size[0], 0),
        _customRadio(_size[1], 1),
        _customRadio(_size[2], 2),
        _customRadio(_size[3], 3),
      ],
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _customRadio(String text, int index) {
    return InkWell(
      onTap: () => changeIndex(index),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        width: 40,
        height: 40,
        child: Text(
          text,
          style: selectedIndex == index
              ? TextStyle(fontSize: 24, color: Colors.black)
              : TextStyle(fontSize: 24, color: Colors.grey[600]),
        ),
        decoration: BoxDecoration(
            color: selectedIndex == index
                ? Color.fromRGBO(255, 185, 5, 1)
                : Colors.transparent,
            border: selectedIndex == index
                ? Border.all(color: Color.fromRGBO(255, 185, 5, 1))
                : Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
