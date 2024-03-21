import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';
import 'package:grocery_app/bloc/shop/shop_state.dart';
import 'package:grocery_app/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopBloc extends Bloc<ShopEvents, ShopState> {
  ShopBloc() : super(GetInitialShopItemState(shopItems: [])) {
    _getShopItems();
    on<ShopItemEvent>((event, emit) {
      _getShopItems();
    });
    on<AddItemInShopEvent>(addItem);
  }

  Future<void> _getShopItems() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    List<dynamic> shopItems = [];
    bool checkKey = await checkKeyContains(
      keyName: "shopItems",
      sharedPreferences: sharedPreferences,
    );
    if (checkKey) {
      sendListOfData(
          keyName: "shopItems", data: [], sharedPreferences: sharedPreferences);
    } else {
      shopItems = getListOfData(
          keyName: "shopItems", sharedPreferences: sharedPreferences);
    }
    emit(GetInitialShopItemState(shopItems: shopItems));
  }

  Future<void> addItem(
      AddItemInShopEvent event, Emitter<ShopState> emit) async {
    print("coming add item");
    final sharedPreferences = await SharedPreferences.getInstance();
    List shopItems = [];
    List data = [
      1,
      event.itemName,
      int.parse(event.itemPrice),
      "assets/${event.itemName}.png"
    ];
    if (await checkKeyContains(
        keyName: "shopItems", sharedPreferences: sharedPreferences)) {
      sendListOfData(
          keyName: "shopItems", data: [data], sharedPreferences: sharedPreferences);
      emit(GetInitialShopItemState(shopItems: const []));
    }
    shopItems = getListOfData(
        keyName: "shopItems", sharedPreferences: sharedPreferences);
    print("event.itemName : ${event.itemName}");
    print("event.itemPrice : ${event.itemPrice}");
    String itemName = event.itemName;
    String itemPrice = event.itemPrice;
    if (itemName.isEmpty ||
        itemPrice.isEmpty ||
        int.parse(event.itemPrice) < 1) {
      shopItems = getListOfData(
          keyName: "shopItems", sharedPreferences: sharedPreferences);
      sendListOfData(
          keyName: "shopItems",
          data: shopItems,
          sharedPreferences: sharedPreferences);
      print("PODA DEI");
      //emit(ImageNotFound());
    } else {
      // Close a dialog, for example
      print("In else");
      try {
        int itemQuantity = 1;
        bool iconStatus = true;
        await rootBundle.load("assets/${event.itemName}.png");

        List data = [
          itemQuantity,
          event.itemName,
          int.parse(event.itemPrice),
          "assets/${event.itemName}.png",
          iconStatus
        ];
        print(data);
        shopItems = getListOfData(
            keyName: "shopItems", sharedPreferences: sharedPreferences);
        for (int i = 0; i < shopItems.length; i++) {
          if (event.itemName == shopItems[i][1]) {
            shopItems.removeAt(i);
            break;
          }
        }
        shopItems.add(data);
        sendListOfData(
            keyName: "shopItems",
            data: data,
            sharedPreferences: sharedPreferences);
        emit(GetInitialShopItemState(shopItems: data));
        print("Success");
      } catch (e) {
        emit(ImageNotFound());
      }
    }
  }
}
