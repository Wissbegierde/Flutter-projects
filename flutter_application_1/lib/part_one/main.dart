// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/part_one/firts_page.dart';
import 'package:flutter_application_1/part_one/home_page.dart';
import 'package:flutter_application_1/part_one/settings_page.dart';


void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget{
   const MyApp({super.key});
    
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirtsPage(),
      routes: {
       '/firstpage': (context) => FirtsPage(),
       '/homepage': (context) => HomePage(),
       '/settings': (context) => SettingsPage(),
      },
    );
  }
}
