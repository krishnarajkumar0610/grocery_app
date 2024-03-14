import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/grocery_event.dart';
import 'package:grocery_app/bloc/grocery_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(DarkThemeState()) {
    on<GreetingEvent>((event, emit) {
      final hour = DateTime.now().hour;
      // Determine the time of day based on the hour
      String message;
      if (hour >= 6 && hour < 12) {
        message = 'Good Morning 🥞';
      } else if (hour >= 12 && hour < 17) {
        message = 'Good Afternoon 🍚';
      } else if (hour >= 17 && hour < 19) {
        message = 'Good Evening 🍟';
      } else {
        message = 'Good Night 🍜';
      }
      print(message);
      emit(GreetingState(greeting: message));
    });

    on<ChangeTheme>((event, emit) {
      emit(state is LightThemeState ? DarkThemeState() : LightThemeState());
    });

    on<GetInitialShopItem>((event, emit) async {
      // List shopItem = [[1,"Avocado",120,"assets/avocado.png",true],];
      final sharedPreference = await SharedPreferences.getInstance();
      print("varudhu varudhu");
      // sharedPreference.clear();
      final users = {"krishna": "2003", "priya": "2005"};
      await sendListOfData(keyName: "users", item: users);
      if (!sharedPreference.containsKey("shopItem")) {
        await sendListOfData(item: [], keyName: "shopItem");
      }

      final data = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: data));
    });

    on<SignInEvent>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      Map<String, dynamic> data =
          jsonDecode("${sharedPreference.getString("users")}");
      print(data);
      final name = event.name.toLowerCase();
      final password = event.password.toLowerCase();

      bool status = false;
      bool isAdmin = false;
      if (name.isNotEmpty &&
          password.isNotEmpty &&
          !name.startsWith(" ") &&
          !password.startsWith(" ")) {
        for (var user in data.entries) {
          if (name == user.key && password == user.value) {
            status = true;
            isAdmin = name == "krishna";
            break;
          }
        }
        if (status) {
          emit(ValidationSuccess(isAdmin: isAdmin));
        }
      } else {
        emit(ValidationFailure());
      }
    });

    on<RemoveFromShop>((event, emit) async {
      List shopItem = event.shopItem;
      int index = event.index;
      shopItem.removeAt(index);

      sendListOfData(keyName: "shopItem", item: shopItem);
      emit(InitialShopState(shopItems: shopItem));
    });

    on<AddNewItemsInShop>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      String itemName = event.itemName.toLowerCase();
      String itemPrice = event.itemPrice;
      List shopItem = [];
      List data = [];
      if ((itemName.isEmpty ||
          itemPrice.isEmpty ||
          itemName.startsWith(" ") ||
          itemPrice.startsWith(" ") ||
          int.parse(itemPrice) < 1)) {
        sendListOfData(keyName: "shopItem", item: event.shopItem);
        shopItem = getListOfData(
            keyName: "shopItem", sharedPreference: sharedPreference);
      } else {
        // Close a dialog, for example
        try {
          int itemQuantity = 1;
          bool iconStatus = true;
          await rootBundle.load("assets/$itemName.png");
          data = [
            itemQuantity,
            itemName,
            int.parse(itemPrice),
            "assets/$itemName.png",
            iconStatus
          ];
          shopItem = getListOfData(
              keyName: "shopItem", sharedPreference: sharedPreference);
          for (int i = 0; i < shopItem.length; i++) {
            if (itemName == shopItem[i][1]) {
              shopItem.removeAt(i);
              break;
            }
          }
          shopItem.add(data);
          sendListOfData(keyName: "shopItem", item: shopItem);
        } catch (e) {
          shopItem = getListOfData(
              keyName: "shopItem", sharedPreference: sharedPreference);
        }
      }
      print("Ama varudhu");
      emit(InitialShopState(shopItems: shopItem));
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
