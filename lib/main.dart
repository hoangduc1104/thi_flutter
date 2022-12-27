import 'package:flutter/material.dart';
import 'package:phuoc_duc_baithi/pages/HomePage.dart';
import 'package:phuoc_duc_baithi/pages/auth/login_page.dart';
import 'package:phuoc_duc_baithi/pages/profile/pages/profile_page.dart';
import 'package:phuoc_duc_baithi/provider/category_provider.dart';
import 'package:phuoc_duc_baithi/provider/product_provider.dart';
import 'package:phuoc_duc_baithi/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}
