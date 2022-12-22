import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/inDevelopment.png'),
          Text(
            'In Developing...',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
    ;
  }
}
