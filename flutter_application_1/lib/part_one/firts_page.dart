// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/part_one/home_page.dart';
import 'package:flutter_application_1/part_one/profile_page.dart';
import 'package:flutter_application_1/part_one/settings_page.dart';


class FirtsPage extends StatefulWidget {
   FirtsPage({super.key});

  @override
  State<FirtsPage> createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  int _selectedIndex = 0;

//this method will navigate to the selected index
  void _navigateTo(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("1st Page"),
    ),
    
    body: _pages[_selectedIndex],

    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _navigateTo,
    items: 
    [
      //home 
      BottomNavigationBarItem(icon: Icon(Icons.home), 
      label: "Home"),

      //profile
      BottomNavigationBarItem(icon: Icon(Icons.person),
      label: "Profile"),
      //settings
      BottomNavigationBarItem(icon: Icon(Icons.settings),
      label: "Settings"),
    ],

    ),
    );
  }
}