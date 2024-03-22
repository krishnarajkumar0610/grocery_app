import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../methods.dart';
import 'shop_event.dart';
import 'shop_state.dart';

class InitialShopBloc extends Bloc<ShopEvent, ShopState> {
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
      sendListOfData(
          keyName: "shopItem",
          item: event.shopItems,
          sharedPreference: sharedPreference);

      emit(InitialShopState(shopItems: event.shopItems));
    });

    on<ChangeAllIcon>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      emit(DummyShop());
      List shopItem = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
      for (int i = 0; i < shopItem.length; i++) {
        shopItem[i][4] = true;
      }

      sharedPreference.remove("shopItem");
      sendListOfData(
          keyName: "shopItem",
          item: shopItem,
          sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: shopItem));
    });

    on<ChangeToCheckmark>((event, emit) async {
      emit(DummyShop());
      final sharedPreference = await SharedPreferences.getInstance();
      List shopItem = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
      shopItem[event.index][4] = false;

      sharedPreference.remove("shopItem");
      sendListOfData(
          keyName: "shopItem",
          item: shopItem,
          sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: shopItem));
    });

    on<ChangeToShopCart>((event, emit) async {
      emit(DummyShop());
      final sharedPreference = await SharedPreferences.getInstance();
      String name = event.itemName;
      List shopItem = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
      for (int i = 0; i < event.shopItem.length; i++) {
        if (name == event.shopItem[i][1]) {
          shopItem[i][4] = true;
          break;
        }
      }

      sharedPreference.remove("shopItem");
      sendListOfData(
          keyName: "shopItem",
          item: shopItem,
          sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: shopItem));
    });

    on<AddNewItemsInShop>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      String itemName = event.itemName.toLowerCase();
      String itemPrice = event.itemPrice;
      List shopItem = [];
      List data = [];
      emit(DummyShop());
      if ((itemName.isEmpty ||
          itemPrice.isEmpty ||
          itemName.startsWith(" ") ||
          itemPrice.startsWith(" ") ||
          itemPrice.contains(RegExp(r'[a-zA-Z]')) || itemName.contains(RegExp(r'[0-9]')) ||
          int.parse(itemPrice) < 1)) {
        shopItem = getListOfData(
            keyName: "shopItem", sharedPreference: sharedPreference);

        emit(ImageNotFound());
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
          sendListOfData(
              keyName: "shopItem",
              item: shopItem,
              sharedPreference: sharedPreference);
          print(shopItem);
        } catch (e) {
          shopItem = getListOfData(
              keyName: "shopItem", sharedPreference: sharedPreference);
          emit(ImageNotFound());
        }
      }
      emit(InitialShopState(shopItems: shopItem));
    });

    on<RemoveFromShop>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      List shopItem = event.shopItem;
      int index = event.index;
      shopItem.removeAt(index);
      sendListOfData(
          keyName: "shopItem",
          item: shopItem,
          sharedPreference: sharedPreference);
      emit(DummyShop());
      emit(InitialShopState(shopItems: shopItem));
    });
    on<GetInitialShopItem>((event, emit) async {
      emit(DummyShop());
      final sharedPreference = await SharedPreferences.getInstance();
      // sharedPreference.clear();
      final users = {"krishna": "2003", "priya": "2005"};
      sendListOfData(
          keyName: "users", item: users, sharedPreference: sharedPreference);
      if (checkKey(key: "shopItem", sharedPreference: sharedPreference)) {
        sendListOfData(
            item: [], keyName: "shopItem", sharedPreference: sharedPreference);
      }

      final data = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);
      emit(InitialShopState(shopItems: data));
    });
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
