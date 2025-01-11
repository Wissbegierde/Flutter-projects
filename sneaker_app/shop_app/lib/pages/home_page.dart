import 'package:flutter/material.dart';
import 'package:shop_app/components/bottom_nav_bar.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //this selected index is to control the bottom navigation bar
  int _selectedIndex= 0;

  //this method will update our selected index
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) => IconButton(
          icon: const Icon(Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(children: [

          //logo
          DrawerHeader(
            child: Image.asset('lib/images/Nike.png')
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),

        //home    

        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            leading: Icon(Icons.home,
              color: Colors.white,
            ),
            title: const Text('Home',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
        ),

        //about
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            leading: Icon(Icons.info,
              color: Colors.white,
            ),
            title: const Text('about',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
        ),
        //logout
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            leading: Icon(Icons.logout,
              color: Colors.white,
            ),
            title: const Text('Logout',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          ),
        ),
        ],
        )
      ),
      body: _pages[_selectedIndex],
    );
  }
}