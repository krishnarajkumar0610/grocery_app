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
}
