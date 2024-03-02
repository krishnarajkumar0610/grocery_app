import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'grocery_events.dart';
import 'grocery_states.dart';

class GroceryBloc extends Bloc<GroceryEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {
    on<GetInitialData>((event, emit) async {
      List shopItem = [
        [
          "Avocado",
          120,
          "assets/avocado.png",
          "Avocado, a creamy fruit native to Mexico, is packed with healthy fats, vitamins, and minerals. Its versatility makes it a popular ingredient in salads, sandwiches, and dips like guacamole.",
          Colors.green.value
        ],
        [
          "Banana",
          60,
          "assets/banana.png",
          "Banana is a tropical fruit with a soft, creamy flesh and a sweet flavor. Rich in potassium and vitamins, it's a popular snack and ingredient in smoothies and desserts.",
          Colors.yellow.value
        ],
        [
          "Chicken",
          350,
          "assets/chicken.png",
          "Chicken is a versatile poultry meat known for its mild flavor and lean protein content. It can be grilled, roasted, fried, or incorporated into a variety of dishes worldwide.",
          Colors.redAccent.value
        ],
        [
          "Water",
          40,
          "assets/water.png",
          "Water is a transparent, tasteless, and odorless substance essential for life on Earth. It comprises about 71% of the planet's surface and is vital for hydration, regulating body temperature, and facilitating various biochemical processes.",
          Colors.blue.value
        ],
        [
          "Apple",
          120,
          "assets/apple.png",
          "Apple Inc. is a multinational technology company known for its innovation in consumer electronics, software, and services, including the iPhone, Mac computers, iPad, and Apple Watch. ",
          Colors.redAccent.value
        ],
        [
          "Orange",
          70,
          "assets/orange.png",
          "Orange is a citrus fruit known for its vibrant color and tangy flavor, rich in vitamin C and antioxidants, often used in juices, desserts, and savory dishes.",
          Colors.orangeAccent.value
        ],
        [
          "Carrot",
          100,
          "assets/carrot.png",
          "Carrot: A crunchy, orange root vegetable known for its high beta-carotene content, promoting eye health and vibrant skin. It's versatile in cooking, adding sweetness to dishes and serving as a popular snack.",
          Colors.deepOrange.value
        ],
        [
          "Watermelon",
          220,
          "assets/watermelon.png",
          "Watermelon is a juicy and refreshing fruit with a vibrant red or pink flesh and black seeds, known for its high water content and sweet flavor, making it a popular summer treat.",
          Colors.lightGreen.value
        ],
        [
          "Cabbage",
          60,
          "assets/cabbage.png",
          "Cabbage is a leafy green or purple biennial plant grown as an annual vegetable crop for its dense-leaved heads. It's rich in vitamins and fiber, commonly used in various cuisines worldwide for salads, soups, and stir-fries.",
          Colors.lightGreenAccent.value
        ],
        [
          "Milk",
          30,
          "assets/milk.png",
          "Milk is a nutrient-rich liquid produced by mammals to nourish their young, containing essential vitamins, minerals, and proteins vital for human health. It serves as a versatile ingredient in various culinary dishes and beverages, offering a creamy texture and distinctive flavor.",
          Colors.grey.value
        ],
        [
          "Potato",
          45,
          "assets/potato.png",
          "Potato, a starchy tuber, is a versatile and widely consumed vegetable prized for its rich carbohydrate content and culinary adaptability, serving as a staple ingredient in countless dishes worldwide.",
          Colors.brown.value
        ],
        [
          "Rocemilk",
          60,
          "assets/rocemilk.png",
          "Rocemilk is an educational platform providing interactive learning experiences through online courses and tutorials. It offers a diverse range of subjects, catering to learners of all levels and interests.",
          Colors.pink.value
        ],
      ]; //

      dynamic data;
      final sharedPreference = await SharedPreferences.getInstance();

      if (!sharedPreference.containsKey("shopItem")) {
        await sendData(keyName: "shopItem", item: shopItem);
        print("DATA SENDED FROM INITIAL DATA CLASS");
      }
      data = getData(keyName: "shopItem", sharedPreference: sharedPreference);
      print("INITIAL DATA : $data");
      emit(GroceryStates(
          shopItems: data,
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus,
          themeStatus: state.themeStatus,
          totalAmount: state.totalAmount));
    });

    on<Clearcart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("cartItem");

      emit(GroceryStates(
          shopItems: state.shopItems,
          cartItems: [],
          greetingStatus: state.greetingStatus,
          themeStatus: state.themeStatus,
          totalAmount: state.totalAmount));
    });

    on<AddToCart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();

      List cartItem = [];
      if (!sharedPreference.containsKey("cartItem")) {
        cartItem.add(state.shopItems?[event.index!]);
        print("ADD TO CART : $cartItem");
        await sendData(keyName: "cartItem", item: cartItem);
      } else {
        cartItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);

        cartItem.add(state.shopItems?[event.index!]);
        print("CART ITEM : $cartItem");
        await sendData(item: cartItem, keyName: "cartItem");
      }
      emit(GroceryStates(
          shopItems: state.shopItems,
          themeStatus: state.themeStatus,
          cartItems: cartItem,
          greetingStatus: state.greetingStatus!,
          totalAmount: state.totalAmount));
    });

    on<RemoveItem>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      // sharedPreference.clear();
      final data;
      List cartItem;

      data = sharedPreference.getString("cartItem");
      cartItem = jsonDecode(data);
      print("ENCODED DATA : $cartItem");
      cartItem.removeAt(event.index!);
      sharedPreference.remove("cartItem");
      await sharedPreference.setString("cartItem", jsonEncode(cartItem));
      print("INSIDE ELSE : $cartItem");

      emit(GroceryStates(
          shopItems: state.shopItems,
          themeStatus: state.themeStatus,
          cartItems: cartItem,
          greetingStatus: state.greetingStatus!,
          totalAmount: state.totalAmount));
    });

    on<ChangeTheme>((event, emit) {
      // changing theme
      var theme = event.themeStatus!;
      var fromLogout = event.fromLogout;
      if (fromLogout) {
        theme = true;
      } else {
        theme = !theme;
      }

      emit(GroceryStates(
          shopItems: state.shopItems,
          themeStatus: theme,
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus!,
          totalAmount: state.totalAmount));
    });

    on<GreetingStatus>((event, emit) {
      final hour = DateTime.now().hour;
      print(hour);
      // Determine the time of day based on the hour
      String message;
      if (hour >= 6 && hour < 12) {
        message = 'Good Morning 🥞';
        print("PODAPODA ");
      } else if (hour >= 12 && hour < 16) {
        message = 'Good Afternoon 🍚';
      } else if (hour >= 16 && hour < 19) {
        message = 'Good Evening 🍟';
      } else {
        message = 'Good Night 🍜';
      }

      emit(GroceryStates(
          greetingStatus: message,
          shopItems: state.shopItems,
          cartItems: state.cartItems,
          themeStatus: state.themeStatus,
          totalAmount: state.totalAmount));
    });

    on<AddQuantity>((event, emit) {});

    on<SignupValidation>((event, emit) {
      String fullName = event.fullName!;
      String email = event.emailId!;
      String password = event.password!;

      if (fullName[0] == " " || fullName.isEmpty) {}
    });
  }

  Future<void> sendData({required final item, required String keyName}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(keyName, jsonEncode(item));
  }

  List<dynamic> getData(
      {required String keyName, required final sharedPreference}) {
    dynamic data = sharedPreference.getString(keyName);
    data = jsonDecode(data);
    return data;
  }
}
