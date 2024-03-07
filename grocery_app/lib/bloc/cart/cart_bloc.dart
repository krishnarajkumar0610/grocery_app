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
      print("INDEX : ${event.index}");
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem = [];
      if (!sharedPreference.containsKey("cartItem")) {
        cartItem.add(event.shopItems[event.index]);
        for (var items in cartItem) {
          for (var item in items) {
            print("$item : ${item.runtimeType}");
          }
        }
        sendData(item: cartItem, keyName: "cartItem");
      } else {
        cartItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
        cartItem.add(event.shopItems[event.index]);
        cartItem[event.index][0] = event.quantity;
        print(cartItem);
        await sharedPreference.remove("cartItem");
        sendData(item: cartItem, keyName: "cartItem");
      }
      emit(CartState(cartItem: cartItem));
    });

    on<RemoveItem>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      // List cartItem =
      //     getData(keyName: "cartItem", sharedPreference: sharedPreference);
      // cartItem.removeAt(event.index!);
      // emit(CartState(cartItem: cartItem));
    });
  }

  void sendData({required final item, required String keyName}) async {
    print("Sendded dataaaaa");
    final sharedPreference = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(item);
    await sharedPreference.setString(keyName, encodedData);
  }

  List<dynamic> getData(
      {required String keyName, required final sharedPreference}) {
    final data = sharedPreference.getString(keyName);
    List<dynamic> encodedData = jsonDecode(data);

    return encodedData;
  }
}
