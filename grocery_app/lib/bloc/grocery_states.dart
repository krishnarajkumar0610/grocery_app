import 'package:flutter/material.dart';

class GroceryStates {
  final List shopItems = [
    [
      "Avocado",
      "120",
      "assets/avocado.png",
      "Avocado, a creamy fruit native to Mexico, is packed with healthy fats, vitamins, and minerals. Its versatility makes it a popular ingredient in salads, sandwiches, and dips like guacamole.",
      Colors.green
    ],
    [
      "Banana",
      "60",
      "assets/banana.png",
      "Banana is a tropical fruit with a soft, creamy flesh and a sweet flavor. Rich in potassium and vitamins, it's a popular snack and ingredient in smoothies and desserts.",
      Colors.yellow
    ],
    [
      "Chicken",
      "350",
      "assets/chicken.png",
      "Chicken is a versatile poultry meat known for its mild flavor and lean protein content. It can be grilled, roasted, fried, or incorporated into a variety of dishes worldwide.",
      Colors.redAccent
    ],
    [
      "Water",
      "40",
      "assets/water.png",
      "Water is a transparent, tasteless, and odorless substance essential for life on Earth. It comprises about 71% of the planet's surface and is vital for hydration, regulating body temperature, and facilitating various biochemical processes.",
      Colors.blue
    ],
    [
      "Avocado",
      "120",
      "assets/avocado.png",
      "Avocado, a creamy fruit native to Mexico, is packed with healthy fats, vitamins, and minerals. Its versatility makes it a popular ingredient in salads, sandwiches, and dips like guacamole.",
      Colors.green
    ],
    [
      "Banana",
      "60",
      "assets/banana.png",
      "Banana is a tropical fruit with a soft, creamy flesh and a sweet flavor. Rich in potassium and vitamins, it's a popular snack and ingredient in smoothies and desserts.",
      Colors.yellow
    ],
    [
      "Chicken",
      "350",
      "assets/chicken.png",
      "Chicken is a versatile poultry meat known for its mild flavor and lean protein content. It can be grilled, roasted, fried, or incorporated into a variety of dishes worldwide.",
      Colors.redAccent
    ],
    [
      "Water",
      "40",
      "assets/water.png",
      "Water is a transparent, tasteless, and odorless substance essential for life on Earth. It comprises about 71% of the planet's surface and is vital for hydration, regulating body temperature, and facilitating various biochemical processes.",
      Colors.blue
    ],
  ]; // List of data's

  final List? cartItems;

  final double? totalPrice;

  int quantity;

  bool? themeStatus;
  String? greetingStatus;

  GroceryStates(
      {this.totalPrice,
      required this.cartItems,
      this.quantity = 1,
      this.greetingStatus,
      this.themeStatus = true});
}
