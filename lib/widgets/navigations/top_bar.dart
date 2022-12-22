import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: TextButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image(
              image: AssetImage(
            'assets/icons/menu.png',
          )),
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              minimumSize: Size(40, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              side: BorderSide(color: Colors.black, width: 1),
              onPrimary: Colors.grey),
        )),
        Container(
          child: Row(
            children: [
              Container(
                  child: TextButton(
                onPressed: () {
                  ApiClient().getProducts();
                },
                child: Image(
                    image: AssetImage(
                  'assets/icons/loupe.png',
                )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(40, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    side: BorderSide(color: Colors.grey, width: 1),
                    onPrimary: Colors.grey),
              )),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Image(
                      image: AssetImage(
                    'assets/icons/controls.png',
                  )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(40, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      side: BorderSide(color: Colors.grey, width: 1),
                      onPrimary: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}*/

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: TextButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
          ),
          //Icon(Icons.now_widgets_outlined, color: Colors.black, size: 30),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: Size(40, 40),
              onPrimary: Colors.grey),
        )),
        Container(
          child: Row(
            children: [
              Container(
                  child: TextButton(
                onPressed: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));*/
                },
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
                //Icon(Icons.search, color: Colors.black, size: 30),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(40, 40),
                    onPrimary: Colors.grey),
              )),
              Container(
                child: TextButton(
                  onPressed: () {
                    /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignPage()));*/
                  },
                  child: SvgPicture.asset(
                    'assets/icons/controls.svg',
                  ),
                  //Icon(Icons.tune, color: Colors.black, size: 30),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(40, 40),
                      onPrimary: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
