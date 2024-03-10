import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shop_event.dart';
import 'shop_state.dart';

class InitialShopBloc extends Bloc<ShopEvent, InitialShopState> {
  InitialShopBloc() : super(InitialShopState(shopItems: [])) {
    on<EditShopItems>((event, emit) async {
      String itemPrice = event.itemPrice;
      String itemName = event.itemName;
      int index = event.index;
      if (itemPrice.isEmpty ||
          itemPrice.startsWith(" ") ||
          itemPrice.startsWith("0")) {
        itemPrice = "${event.shopItems[index][2]}";
      }
      if (itemName.isEmpty || itemName.startsWith(" ")) {
        itemName = event.shopItems[index][1];
      }
      event.shopItems[index][1] = itemName;
      event.shopItems[index][2] = int.parse(itemPrice);
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItems");
      sendListOfData(keyName: "shopItems", item: event.shopItems);

      print("Data changed ");
      emit(InitialShopState(shopItems: event.shopItems));
    });

    on<ChangeAllIcon>((event, emit) async {
      for (int i = 0; i < state.shopItems.length; i++) {
        state.shopItems[i][7] = true;
      }
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItems");
      sendListOfData(keyName: "shopItems", item: state.shopItems);
      emit(InitialShopState(shopItems: state.shopItems));
    });

    on<ChangeToCheckmark>((event, emit) async {
      event.shopItem[event.index][7] = false;
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItems");
      sendListOfData(keyName: "shopItems", item: event.shopItem);
      emit(InitialShopState(shopItems: event.shopItem));
    });

    on<ChangeToShopCart>((event, emit) async {
      String name = event.itemName;
      print(name);
      for (int i = 0; i < event.shopItem.length; i++) {
        if (name == event.shopItem[i][1]) {
          event.shopItem[i][7] = true;
          break;
        }
      }
      print("icon changed");
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItems");
      sendListOfData(keyName: "shopItems", item: event.shopItem);
      emit(InitialShopState(shopItems: event.shopItem));
    });

    on<GetInitialShopItem>((event, emit) async {
      List shopItem = [
        [
          1,
          "Avocado",
          120,
          120, // total price
          "assets/avocado.png",
          "Avocado, a creamy fruit native to Mexico, is packed with healthy fats, vitamins, and minerals. Its versatility makes it a popular ingredient in salads, sandwiches, and dips like guacamole.",
          Colors.green.value,
          true
        ],
        [
          1,
          "Banana",
          60,
          60,
          "assets/banana.png",
          "Banana is a tropical fruit with a soft, creamy flesh and a sweet flavor. Rich in potassium and vitamins, it's a popular snack and ingredient in smoothies and desserts.",
          Colors.yellow.value,
          true
        ],
        [
          1,
          "Chicken",
          350,
          350,
          "assets/chicken.png",
          "Chicken is a versatile poultry meat known for its mild flavor and lean protein content. It can be grilled, roasted, fried, or incorporated into a variety of dishes worldwide.",
          Colors.redAccent.value,
          true
        ],
        [
          1,
          "Water",
          40,
          40,
          "assets/water.png",
          "Water is a transparent, tasteless, and odorless substance essential for life on Earth. It comprises about 71% of the planet's surface and is vital for hydration, regulating body temperature, and facilitating various biochemical processes.",
          Colors.blue.value,
          true
        ],
        [
          1,
          "Apple",
          120,
          120,
          "assets/apple.png",
          "Apple Inc. is a multinational technology company known for its innovation in consumer electronics, software, and services, including the iPhone, Mac computers, iPad, and Apple Watch. ",
          Colors.redAccent.value,
          true
        ],
        [
          1,
          "Orange",
          70,
          70,
          "assets/orange.png",
          "Orange is a citrus fruit known for its vibrant color and tangy flavor, rich in vitamin C and antioxidants, often used in juices, desserts, and savory dishes.",
          Colors.orangeAccent.value,
          true
        ],
        [
          1,
          "Carrot",
          100,
          100,
          "assets/carrot.png",
          "Carrot: A crunchy, orange root vegetable known for its high beta-carotene content, promoting eye health and vibrant skin. It's versatile in cooking, adding sweetness to dishes and serving as a popular snack.",
          Colors.deepOrange.value,
          true
        ],
        [
          1,
          "Watermelon",
          220,
          220,
          "assets/watermelon.png",
          "Watermelon is a juicy and refreshing fruit with a vibrant red or pink flesh and black seeds, known for its high water content and sweet flavor, making it a popular summer treat.",
          Colors.lightGreen.value,
          true
        ],
        [
          1,
          "Cabbage",
          60,
          60,
          "assets/cabbage.png",
          "Cabbage is a leafy green or purple biennial plant grown as an annual vegetable crop for its dense-leaved heads. It's rich in vitamins and fiber, commonly used in various cuisines worldwide for salads, soups, and stir-fries.",
          Colors.lightGreenAccent.value,
          true
        ],
        [
          1,
          "Milk",
          30,
          30,
          "assets/milk.png",
          "Milk is a nutrient-rich liquid produced by mammals to nourish their young, containing essential vitamins, minerals, and proteins vital for human health. It serves as a versatile ingredient in various culinary dishes and beverages, offering a creamy texture and distinctive flavor.",
          Colors.grey.value,
          true
        ],
        [
          1,
          "Potato",
          45,
          45,
          "assets/potato.png",
          "Potato, a starchy tuber, is a versatile and widely consumed vegetable prized for its rich carbohydrate content and culinary adaptability, serving as a staple ingredient in countless dishes worldwide.",
          Colors.brown.value,
          true
        ],
        [
          1,
          "Rocemilk",
          60,
          60,
          "assets/rocemilk.png",
          "Rocemilk is an educational platform providing interactive learning experiences through online courses and tutorials. It offers a diverse range of subjects, catering to learners of all levels and interests.",
          Colors.pink.value,
          true
        ],
      ];
      final sharedPreference = await SharedPreferences.getInstance();

      print(sharedPreference.containsKey("cartItem"));
      final users = {"krishna": "2003", "priya": "2005"};
      await sendListOfData(keyName: "users", item: users);
      if (!sharedPreference.containsKey("shopItems")) {
        print("pogama");
        await sendListOfData(item: shopItem, keyName: "shopItems");
      }
      print("Inga vantea");
      final data = getListOfData(
          keyName: "shopItems", sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: data));
    });
  }

  Future<void> sendListOfData({required keyName, required item}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(item);

    await sharedPreference.setString(keyName, encodedData);
  }

  List<dynamic> getListOfData({required keyName, required sharedPreference}) {
    final data = sharedPreference.getString(keyName);
    final decodedData = jsonDecode(data!);
    return decodedData;
  }
}
