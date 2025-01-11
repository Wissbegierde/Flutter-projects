import 'package:flutter/material.dart';
import 'package:shop_app/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(name: 'Zoom FREAK', 
    price: '236', 
    imagePath: 'lib/images/Sneakers.png', 
    description: 'The Forward-thinking desing of his latest signature shoe.'),
    
    Shoe(name: 'Air Jordan',
    price: '240',
    imagePath: 'lib/images/AirJordan.png',
    description: 'Cool shoe'),

    Shoe(name: 'Airforce',
    price: '200',
    imagePath: 'lib/images/Airforce.png',
    description: 'Fire'),

    Shoe(name: 'Kyrie',
    price: '180',
    imagePath: 'lib/images/Kyrie.png',
    description: 'Nutty'),

  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart(){
    return userCart;
  }
  //add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from the cart.
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}