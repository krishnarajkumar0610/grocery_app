import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      sharedPreference.remove("shopItem");
      sendListOfData(keyName: "shopItem", item: event.shopItems);

      print("Data changed ");
      emit(InitialShopState(shopItems: event.shopItems));
    });

    on<ChangeAllIcon>((event, emit) async {
      for (int i = 0; i < state.shopItems.length; i++) {
        state.shopItems[i][4] = true;
      }
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItem");
      sendListOfData(keyName: "shopItem", item: state.shopItems);
      emit(InitialShopState(shopItems: state.shopItems));
    });

    on<ChangeToCheckmark>((event, emit) async {
      event.shopItem[event.index][4] = false;
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItem");
      sendListOfData(keyName: "shopItem", item: event.shopItem);
      emit(InitialShopState(shopItems: event.shopItem));
    });

    on<ChangeToShopCart>((event, emit) async {
      String name = event.itemName;
      print(name);
      for (int i = 0; i < event.shopItem.length; i++) {
        if (name == event.shopItem[i][1]) {
          event.shopItem[i][4] = true;
          break;
        }
      }
      print("icon changed");
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("shopItem");
      sendListOfData(keyName: "shopItem", item: event.shopItem);
      emit(InitialShopState(shopItems: event.shopItem));
    });

    on<AddNewItemsInShop>((event, emit) async {
      String itemName = event.itemName.toLowerCase();
      String itemPrice = event.itemPrice;
      List shopItem = [];
      List data = [];
      if ((itemName.isEmpty ||
          itemPrice.isEmpty ||
          itemName.startsWith(" ") ||
          itemPrice.startsWith(" "))) {
        showAlert(
            context: event.context, text: "Name or price should not be empty");
      } else {
        // Close a dialog, for example
        try {
          int itemQuantity = 1;
          bool iconStatus = true;
          await rootBundle.load("assets/$itemName.png");
          data = [
            itemQuantity,
            itemName,
            itemPrice,
            "assets/$itemName.png",
            iconStatus
          ];

          final sharedPreference = await SharedPreferences.getInstance();
          print(getListOfData(
              keyName: "shopItem", sharedPreference: sharedPreference));
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
          showAlert(
              context: event.context, text: "Image path does not contain");
          shopItem = [];
        }
      }
      emit(InitialShopState(shopItems: shopItem));
    });

    on<RemoveFromShop>((event, emit) async {
      List shopItem = event.shopItem;
      int index = event.index;
      shopItem.removeAt(index);
      print("SHOPITEM : $shopItem");
      sendListOfData(keyName: "shopItem", item: shopItem);
      emit(InitialShopState(shopItems: shopItem));
    });
    on<GetInitialShopItem>((event, emit) async {
      // List shopItem = [[1,"Avocado",120,"assets/avocado.png",true],];

      final sharedPreference = await SharedPreferences.getInstance();
      // sharedPreference.clear();
      final users = {"krishna": "2003", "priya": "2005"};
      await sendListOfData(keyName: "users", item: users);
      if (!sharedPreference.containsKey("shopItem")) {
        print("pogama");
        await sendListOfData(item: [], keyName: "shopItem");
      }
      print("get panudhu");
      final data = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
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

  void showAlert({required final context, required final text}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(
          Icons.error,
          color: Colors.red,
          size: 30,
        ),
        content: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            child: const Text(
              "Close",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
