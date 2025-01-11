import 'package:adgadgag/components/my_drawer.dart';
import 'package:adgadgag/components/my_product_tile.dart';
import 'package:adgadgag/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {  
  const ShopPage({super.key});
  @override
  Widget build(BuildContext context) {
    
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop Page"),
      ),
    drawer: const MyDrawer(),
    backgroundColor: Theme.of(context).colorScheme.surface,
    body: ListView(
      children: [
        const SizedBox(height: 25,),
        //title
        Center(child: Text("Pick from a selected list o f premium products",
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        )),

        //product List
        SizedBox(
      height: 550,
      child: ListView.builder(
        itemCount: products.length, 
        padding:  EdgeInsets.all(15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
      
        //get each individual product from shop
        final product= products[index];
      
        //return as a product tile UI
        return MyProductTile(product: product);
      
      }, ),
    ),
      ],
    ),

    );
  }
}