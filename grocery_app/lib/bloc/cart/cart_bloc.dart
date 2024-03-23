import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(MyCartState(cartItem: [])) {
    on<Clearcart>(clearCart);
    on<GetInitialCartData>(getInitialShopItems);
    on<AddToCart>(addToCart);
    on<RemoveItem>(removeFromSCart);
  }

  int getTotalAmount({required List cartItems}) {
    int totalAmount = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalAmount += cartItems[i][0] * cartItems[i][2] as int;
    }
    return totalAmount;
  }

  int removeAmount(
      {required List cartItem,
      required String itemName,
      required int totalAmount}) {
    for (int i = 0; i < cartItem.length; i++) {
      if (cartItem[i][1] == itemName) {
        totalAmount -= cartItem[i][0] * cartItem[i][2] as int;
        cartItem.removeAt(i);
        break;
      }
    }
    return totalAmount;
  }

  Future<void> clearCart(Clearcart event, Emitter<CartState> emit) async {
    emit(DummyCart());
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.remove("cartItem");
    emit(MyCartState(
      cartItem: const [],
    ));
  }

  Future<void> getInitialShopItems(
      GetInitialCartData event, Emitter<CartState> emit) async {
    emit(DummyCart());
    int totalAmount = 0;
    final sharedPreference = await SharedPreferences.getInstance();
    final List cartItems;
    if (!sharedPreference.containsKey("cartItem")) {
      cartItems = [];
      sendListOfData(
          item: cartItems,
          keyName: "cartItem",
          sharedPreference: sharedPreference);
    } else {
      cartItems = getListOfData(
          keyName: "cartItem", sharedPreference: sharedPreference);
    }
    totalAmount = getTotalAmount(cartItems: cartItems);
    emit(MyCartState(
      cartItem: cartItems,
    ));
  }

  Future<void> addToCart(AddToCart event, Emitter<CartState> emit) async {
    emit(DummyCart());
    List<dynamic> datas = event.shopItems[event.index];
    final sharedPreference = await SharedPreferences.getInstance();
    List cartItem = [];
    datas[0] = event.quantity;
    int totalAmount = 0;
    if (checkKey(key: "cartItem", sharedPreference: sharedPreference)) {
      cartItem.add(datas);
      totalAmount = datas[0] * datas[2];
      sendListOfData(
          item: [datas],
          keyName: "cartItem",
          sharedPreference: sharedPreference);
    } else {
      cartItem = getListOfData(
          keyName: "cartItem", sharedPreference: sharedPreference);
      String itemName = datas[1];
      totalAmount = getTotalAmount(cartItems: cartItem);
      totalAmount = removeAmount(
          cartItem: cartItem, itemName: itemName, totalAmount: totalAmount);
      cartItem.add(datas);
      totalAmount += cartItem[cartItem.length - 1][0] *
          cartItem[cartItem.length - 1][2] as int;
      sharedPreference.remove("cartItem");
      sendListOfData(
          item: cartItem,
          keyName: "cartItem",
          sharedPreference: sharedPreference);
    }
    emit(MyCartState(
      cartItem: cartItem,
    ));
  }

  Future<void> removeFromSCart(
      RemoveItem event, Emitter<CartState> emit) async {
    emit(DummyCart());
    final sharedPreference = await SharedPreferences.getInstance();
    List cartItem =
        getListOfData(keyName: "cartItem", sharedPreference: sharedPreference);
    getListOfData(keyName: "cartItem", sharedPreference: sharedPreference);
    //totalAmount -= cartItem[event.index][0] * cartItem[event.index][2] as int;
    cartItem.removeAt(event.index);
    sharedPreference.remove("cartItem");
    sendListOfData(
        item: cartItem,
        keyName: "cartItem",
        sharedPreference: sharedPreference);
    emit(MyCartState(
      cartItem: cartItem,
    ));
  }
}
