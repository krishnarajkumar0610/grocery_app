import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(LoadingCartItemsState()) {
    on<ClearCartItemsEvent>(clearCart);
    on<GetInitialCartDataEvent>(getInitialCartItems);
    on<AddToCartEvent>(addToCart);
    on<RemoveItemFomCartEvent>(removeItem);
  }

  Future<void> clearCart(ClearCartItemsEvent event, Emitter<CartState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.remove("cartItem");
    emit(MyCartState(cartItem: const [], totalAmount: 0));
  }

  Future<void> getInitialCartItems(
      GetInitialCartDataEvent event, Emitter<CartState> emit) async {
    emit(LoadingCartItemsState());
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
    emit(LoadingCartItemsState());
    await Future.delayed(const Duration(seconds: 1),
        () => emit(MyCartState(cartItem: cartItems, totalAmount: totalAmount)));
  }

  Future<void> addToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    List<dynamic> datas = event.shopItems[event.index];
    final sharedPreference = await SharedPreferences.getInstance();
    List cartItem = [];
    datas[0] = event.quantity;
    int totalAmount = 0;
    if (!sharedPreference.containsKey("cartItem")) {
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
    emit(LoadingCartItemsState());
    emit((MyCartState(cartItem: cartItem, totalAmount: totalAmount)));
  }

  Future<void> removeItem(
      RemoveItemFomCartEvent event, Emitter<CartState> emit) async {
    final sharedPreference = await SharedPreferences.getInstance();

    List cartItem =
        getListOfData(keyName: "cartItem", sharedPreference: sharedPreference);
    int totalAmount = getTotalAmount(cartItems: cartItem);

    totalAmount -= cartItem[event.index][0] * cartItem[event.index][2] as int;
    cartItem.removeAt(event.index);
    print("removed item : $cartItem");
    sharedPreference.remove("cartItem");
    sendListOfData(
        item: cartItem,
        keyName: "cartItem",
        sharedPreference: sharedPreference);
    emit(MyCartState(cartItem: cartItem, totalAmount: totalAmount));
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
}
