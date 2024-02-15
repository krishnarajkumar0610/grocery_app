import 'package:flutter/material.dart';

class GroceryStates {
  List shopItems = [
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
      "Apple",
      "120",
      "assets/apple.png",
      "Apple Inc. is a multinational technology company known for its innovation in consumer electronics, software, and services, including the iPhone, Mac computers, iPad, and Apple Watch. ",
      Colors.redAccent
    ],
    [
      "Orange",
      "70",
      "assets/orange.png",
      "Orange is a citrus fruit known for its vibrant color and tangy flavor, rich in vitamin C and antioxidants, often used in juices, desserts, and savory dishes.",
      Colors.orangeAccent
    ],
    [
      "Carrot",
      "100",
      "assets/carrot.png",
      "Carrot: A crunchy, orange root vegetable known for its high beta-carotene content, promoting eye health and vibrant skin. It's versatile in cooking, adding sweetness to dishes and serving as a popular snack.",
      Colors.deepOrange
    ],
    [
      "Watermelon",
      "220",
      "assets/watermelon.png",
      "Watermelon is a juicy and refreshing fruit with a vibrant red or pink flesh and black seeds, known for its high water content and sweet flavor, making it a popular summer treat.",
      Colors.lightGreen
    ],
  ]; // List
  // of data's

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
