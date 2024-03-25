import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../methods.dart';
import 'shop_event.dart';
import 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(LoadingShopItemsState()) {
    on<GetInitialShopItem>(getInitialShopItem);
    on<AddNewItemsInShop>(addNewItemsInShop);
    on<RemoveFromShop>(removeFromShop);
    on<EditShopItems>(editShopItems);
    on<ChangeToCheckmark>(changeToCheckMark);
    on<ChangeToShopCart>(changeToShopCart);
    on<ChangeAllIcon>(changeAllIcon);
    on<BuyItemEvent>(buyItem);
  }

  Future<void> editShopItems(
      EditShopItems event, Emitter<ShopState> emit) async {
    String itemPrice = event.itemPrice;
    String itemName = event.itemName;
    int index = event.index;
    if (itemPrice.isEmpty ||
        itemPrice.startsWith(" ") ||
        int.parse(itemPrice) < 1) {
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
  }

  Future<void> changeAllIcon(
      ChangeAllIcon event, Emitter<ShopState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    emit(DummyShopState());
    List shopItem =
        getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
    for (int i = 0; i < shopItem.length; i++) {
      shopItem[i][4] = true;
    }

    sharedPreference.remove("shopItem");
    sendListOfData(
        keyName: "shopItem",
        item: shopItem,
        sharedPreference: sharedPreference);

    emit(InitialShopState(shopItems: shopItem));
  }

  Future<void> changeToCheckMark(
      ChangeToCheckmark event, Emitter<ShopState> emit) async {
    emit(DummyShopState());
    final sharedPreference = await SharedPreferences.getInstance();
    List shopItem =
        getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
    shopItem[event.index][4] = false;

    sharedPreference.remove("shopItem");
    sendListOfData(
        keyName: "shopItem",
        item: shopItem,
        sharedPreference: sharedPreference);
    emit(InitialShopState(shopItems: shopItem));
  }

  Future<void> changeToShopCart(
      ChangeToShopCart event, Emitter<ShopState> emit) async {
    emit(DummyShopState());
    final sharedPreference = await SharedPreferences.getInstance();
    String name = event.itemName;
    List shopItem =
        getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
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
  }

  Future<void> addNewItemsInShop(
      AddNewItemsInShop event, Emitter<ShopState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    String itemName = event.itemName.toLowerCase();
    String itemPrice = event.itemPrice;
    List shopItem = [];
    List data = [];
    emit(DummyShopState());
    if ((itemName.isEmpty ||
        itemPrice.isEmpty ||
        itemName.startsWith(" ") ||
        itemPrice.startsWith(" ") ||
        itemPrice.contains(RegExp(r'[a-zA-Z]')) ||
        itemName.contains(RegExp(r'[0-9]')) ||
        int.parse(itemPrice) < 1)) {
      shopItem = getListOfData(
          keyName: "shopItem", sharedPreference: sharedPreference);

      emit(ItemNotFoundState());
      emit(InitialShopState(shopItems: shopItem));
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
        emit(ItemAddInShopSuccessState());
        emit(InitialShopState(shopItems: shopItem));
      } catch (e) {
        shopItem = getListOfData(
            keyName: "shopItem", sharedPreference: sharedPreference);
        emit(ItemNotFoundState());
      }
    }
  }

  Future<void> removeFromShop(
      RemoveFromShop event, Emitter<ShopState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    List shopItem = event.shopItem;
    int index = event.index;
    shopItem.removeAt(index);
    sendListOfData(
        keyName: "shopItem",
        item: shopItem,
        sharedPreference: sharedPreference);
    emit(DummyShopState());
    emit(InitialShopState(shopItems: shopItem));
  }

  Future<void> getInitialShopItem(
      GetInitialShopItem event, Emitter<ShopState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    // sharedPreference.clear();
    final users = {"krishna": "2003", "priya": "2005"};
    sendListOfData(
        keyName: "users", item: users, sharedPreference: sharedPreference);
    if (checkKey(key: "shopItem", sharedPreference: sharedPreference)) {
      sendListOfData(
          item: [], keyName: "shopItem", sharedPreference: sharedPreference);
    }

    final data =
        getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
    emit(LoadingShopItemsState());
    await Future.delayed(const Duration(seconds: 1),
        () => emit(InitialShopState(shopItems: data)));
  }

  Future<void> buyItem(BuyItemEvent event, Emitter<ShopState> emit) async {
    emit(DummyShopState());
    emit(BuyItemState());
    final sharedPreference = await SharedPreferences.getInstance();
    List shopItem =
        getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
    emit(InitialShopState(shopItems: shopItem));
  }

// Future<void> loading(
//     LoadingShopItemsEvent event, Emitter<ShopState> emit) async {
//   final sharedPreference = await SharedPreferences.getInstance();
//   List shopItems =
//       getListOfData(keyName: "shopItem", sharedPreference: sharedPreference);
//   emit(LoadingShopItemsState());
//   await Future.delayed(const Duration(seconds: 1),
//       () => emit(InitialShopState(shopItems: shopItems)));
// }
}
