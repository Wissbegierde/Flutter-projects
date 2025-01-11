import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/cart_item.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //heading
          Text('My cart',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          ),

          const SizedBox(height: 10.0),

          Expanded(child: ListView.builder( 
            itemCount: value.getUserCart().length,
            itemBuilder: (context, index) {
            //get individual shoe
            Shoe individualShoe = value.getUserCart()[index];
            
            //return the cart item
            return CartItem(shoe: individualShoe);
          }
          
          ,),
          )

        ],
      ),
    ),
    
    );
  }
}