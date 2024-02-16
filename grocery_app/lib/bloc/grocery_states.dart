import 'package:flutter/material.dart';

class GroceryStates {
  List shopItems = [
    [
      "Avocado",
      120,
      0,
      0,
      "assets/avocado.png",
      "Avocado, a creamy fruit native to Mexico, is packed with healthy fats, vitamins, and minerals. Its versatility makes it a popular ingredient in salads, sandwiches, and dips like guacamole.",
      Colors.green
    ],
    [
      "Banana",
      60,
      0,
      0,
      "assets/banana.png",
      "Banana is a tropical fruit with a soft, creamy flesh and a sweet flavor. Rich in potassium and vitamins, it's a popular snack and ingredient in smoothies and desserts.",
      Colors.yellow
    ],
    [
      "Chicken",
      350,
      0,
      0,
      "assets/chicken.png",
      "Chicken is a versatile poultry meat known for its mild flavor and lean protein content. It can be grilled, roasted, fried, or incorporated into a variety of dishes worldwide.",
      Colors.redAccent
    ],
    [
      "Water",
      40,
      0,
      0,
      "assets/water.png",
      "Water is a transparent, tasteless, and odorless substance essential for life on Earth. It comprises about 71% of the planet's surface and is vital for hydration, regulating body temperature, and facilitating various biochemical processes.",
      Colors.blue
    ],
    [
      "Apple",
      120,
      0,
      0,
      "assets/apple.png",
      "Apple Inc. is a multinational technology company known for its innovation in consumer electronics, software, and services, including the iPhone, Mac computers, iPad, and Apple Watch. ",
      Colors.redAccent
    ],
    [
      "Orange",
      70,
      0,
      0,
      "assets/orange.png",
      "Orange is a citrus fruit known for its vibrant color and tangy flavor, rich in vitamin C and antioxidants, often used in juices, desserts, and savory dishes.",
      Colors.orangeAccent
    ],
    [
      "Carrot",
      100,
      0,
      0,
      "assets/carrot.png",
      "Carrot: A crunchy, orange root vegetable known for its high beta-carotene content, promoting eye health and vibrant skin. It's versatile in cooking, adding sweetness to dishes and serving as a popular snack.",
      Colors.deepOrange
    ],
    [
      "Watermelon",
      220,
      0,
      0,
      "assets/watermelon.png",
      "Watermelon is a juicy and refreshing fruit with a vibrant red or pink flesh and black seeds, known for its high water content and sweet flavor, making it a popular summer treat.",
      Colors.lightGreen
    ],
    [
      "Cabbage",
      60,
      0,
      0,
      "assets/cabbage.png",
      "Cabbage is a leafy green or purple biennial plant grown as an annual vegetable crop for its dense-leaved heads. It's rich in vitamins and fiber, commonly used in various cuisines worldwide for salads, soups, and stir-fries.",
      Colors.lightGreenAccent
    ],
    [
      "Milk",
      30,
      0,
      0,
      "assets/milk.png",
      "Milk is a nutrient-rich liquid produced by mammals to nourish their young, containing essential vitamins, minerals, and proteins vital for human health. It serves as a versatile ingredient in various culinary dishes and beverages, offering a creamy texture and distinctive flavor.",
      Colors.grey
    ],
    [
      "Potato",
      45,
      0,
      0,
      "assets/potato.png",
      "Potato, a starchy tuber, is a versatile and widely consumed vegetable prized for its rich carbohydrate content and culinary adaptability, serving as a staple ingredient in countless dishes worldwide.",
      Colors.brown
    ],
    [
      "Rocemilk",
      60,
      0,
      0,
      "assets/rocemilk.png",
      "Rocemilk is an educational platform providing interactive learning experiences through online courses and tutorials. It offers a diverse range of subjects, catering to learners of all levels and interests.",
      Colors.pink
    ],
  ]; // List
  // of data's

  final List? cartItems;

  int? quantity;

  bool? themeStatus;
  String? greetingStatus;
  int? totalAmount;

  GroceryStates(
      {required this.cartItems,
      this.quantity = 0,
      this.totalAmount,
      this.greetingStatus,
      this.themeStatus = true});
}
