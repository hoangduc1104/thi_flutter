import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final AssetImage image;
  final Color backColor;
  final Color borderColor;

  const NavigationButton({
    Key? key,
    required this.backColor,
    required this.borderColor,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Image(image: image),
      style: ElevatedButton.styleFrom(
          primary: backColor,
          minimumSize: Size(40, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          side: BorderSide(color: borderColor, width: 1),
          onPrimary: Colors.grey),
    );
  }
}
