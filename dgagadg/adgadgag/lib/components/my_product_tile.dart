import 'package:adgadgag/models/product.dart';
import 'package:adgadgag/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key,
  required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context){
  //show a dialog box to confirm
  showDialog(context: context, 
  builder: (context) => AlertDialog(
    content: Text('Add ${product.name} to cart?'),
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

        context.read<Shop>().addToCart(product);
        
        },
      child: Text("Yes"),
       )
    ],
  ));

  }




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),

      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [
              //product image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(25),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(25),
              child: const Icon(Icons.favorite)),
          ),
          
          const SizedBox(height: 25,),

          //product name
          Text(product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),

          const SizedBox(height: 10,),

          //description
          Text(product.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            
          )),

          const SizedBox(height: 25,),
            ],
          ),

          //price+add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //produt price
              Text('\$'+product.price.toStringAsFixed(2)),
              
              //add to cart button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(onPressed: () => addToCart(context), 
                icon: const Icon(Icons.add))),
            ],
          ),
        ],
      ),
    );
  }
}