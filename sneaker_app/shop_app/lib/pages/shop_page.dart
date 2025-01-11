import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/shoe_tile.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  //add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert user, shoe added to cart
    showDialog(context: context, 
    builder: (context) => AlertDialog(
      title: Text('Successfully added!'),
      content: Text('${shoe.name} has been added to your cart'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) 
    => Column(children: [
      //search Bar
      Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(  
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Search",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            ),
            Icon(Icons.search, 
            color: Colors.grey),
          ],
        ),
        
      ),

      //message
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Text('everyone flies.. some fly longer than others',
        style: TextStyle(
          color: Colors.grey[600],
        )),
      ),

      //hot picks
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Text('Hot Picks 🔥',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          Text('See all',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          )),
        
        
        ],),
      ),

      const SizedBox(height: 10),

      Expanded(
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index)
      {
        //create a shoe
        Shoe shoe= value.getShoeList()[index];

        //return the shoe
        return ShoeTile(
          shoe: shoe,
          onTap: () => addShoeToCart(shoe),
        );

      },
      )
      ),

      const Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25, right: 25),
        child: Divider(
          color: Colors.white,
          
        ),
      )

    ],
    ),
    );
  }
}