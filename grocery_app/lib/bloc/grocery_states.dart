import 'package:flutter/material.dart';

class GroceryStates {
  final List shopItems = [
    ["Avocado", "120", "assets/avocado.png", Colors.green],
    ["Banana", "60", "assets/banana.png", Colors.yellow],
    ["Chicken", "350", "assets/chicken.png", Colors.brown],
    ["Water", "40", "assets/water.png", Colors.blue],
    ["Avocado", "120", "assets/avocado.png", Colors.green],
    ["Banana", "60", "assets/banana.png", Colors.yellow],
    ["Chicken", "350", "assets/chicken.png", Colors.brown],
    ["Water", "40", "assets/water.png", Colors.blue],
  ];

  List cartItems;

  double? totalPrice;
  int? quantity;

  GroceryStates({this.totalPrice, required this.cartItems, this.quantity});
}
