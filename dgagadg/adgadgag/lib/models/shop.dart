import 'package:adgadgag/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{

  //products for sale
  final List<Product> _shop =[
    //product 1
    Product(
      name: 'Product 1',
      price: 100.00,
      description: 'This is a description of product 1',
      // imagePath: 'assets/images/product1.jpg',
    ),

    //product 2
    Product(
      name: 'Product 2',
      price: 100.00,
      description: 'This is a description of product 2',
      // imagePath: 'assets/images/product1.jpg',
    ),

    //product 3
    Product(
      name: 'Product 3',
      price: 100.00,
      description: 'This is a description of product 3',
      // imagePath: 'assets/images/product1.jpg',
    ),

    //product 4
    Product(
      name: 'Product 4',
      price: 100.00,
      description: 'This is a description of product 4',
      // imagePath: 'assets/images/product1.jpg',
    ),

  ];

  //user cart
    List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product product){
    _cart.add(product);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product product){
    _cart.remove(product);
    notifyListeners();
  }

}