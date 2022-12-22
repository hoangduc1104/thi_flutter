import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
  }
}
