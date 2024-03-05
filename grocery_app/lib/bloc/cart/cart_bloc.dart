import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(CartState(cartItem: [])) {
    on<Clearcart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("cartItem");
      emit(CartState(cartItem: []));
    });

    on<AddToCart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem = [];
      if (!sharedPreference.containsKey("cartItem")) {
        cartItem.add(event.shopItems![event.index!]);
        sendData(keyName: "cartItem", item: cartItem);
      } else {
        cartItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
        cartItem.add(event.shopItems![event.index!]);
      }
      emit(CartState(cartItem: cartItem));
    });

    on<RemoveItem>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem =
          getData(keyName: "cartItem", sharedPreference: sharedPreference);
      cartItem.removeAt(event.index!);
      emit(CartState(cartItem: cartItem));
    });
  }

  void sendData({required final item, required String keyName}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    await sharedPreference.setString(keyName, jsonEncode(item));
  }

  List<dynamic> getData(
      {required String keyName, required final sharedPreference}) {
    dynamic data = sharedPreference.getString(keyName);
    data = jsonDecode(data);
    return data;
  }
}
