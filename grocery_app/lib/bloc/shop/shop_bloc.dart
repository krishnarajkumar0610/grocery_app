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
    //sharedPreferences.clear();
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
      AddItemInShopEvent event, Emitter<ShopState> emit) async {}
}
