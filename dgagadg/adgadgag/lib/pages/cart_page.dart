import 'package:adgadgag/models/product.dart';
import 'package:adgadgag/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart
  void removeItemFromCart(BuildContext context, Product product){
    //show a dialog box to confirm
  showDialog(context: context, 
  builder: (context) => AlertDialog(
    content: Text('Remove this item from your cart?'),
    actions: [

      //cancel button
      MaterialButton(onPressed: () => Navigator.pop(context),
      child: Text("Cancel"),
       ),

      //yes button
      MaterialButton(onPressed: () {
        
        //pop the dialog box
        Navigator.pop(context);

        //add to cart

        context.read<Shop>().removeFromCart(product);
        
        },
      child: Text("Yes"),
       )
    ],
  ));
  }



  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Cart page"),
        foregroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(children: [
        //Cart list
        Expanded(
          child: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index){
            //get individual item in cart
            final item= cart[index];



            //return as a cart tile UI
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => removeItemFromCart(context, item),
              ),
            );
          }
          ),
        ),
      ],

      //pay button
      

      
      
      
      ),
    );
  }
}