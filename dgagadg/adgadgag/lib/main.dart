import 'package:adgadgag/models/shop.dart';
import 'package:adgadgag/pages/cart_page.dart';
import 'package:adgadgag/pages/intro_page.dart';
import 'package:adgadgag/pages/shop_page.dart';
import 'package:adgadgag/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( 
  ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro': (context) => const IntroPage(),
        '/shop': (context) => const ShopPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}