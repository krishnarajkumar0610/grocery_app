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
      // event.shopItems?[11][0] = event.quantity;
      // print(event.shopItems?[11][0]);
      List<dynamic> item = [];
      final sharedPreference = await SharedPreferences.getInstance();
      if (!sharedPreference.containsKey("cartItem")) {
        item.add(event.shopItems?[event.index!]);
        sendData(item: item, keyName: "cartItem");
      } else {
        item = getData(keyName: "cartItem", sharedPreference: sharedPreference);
        item.add(event.shopItems?[event.index!]);
        item[event.index!][0] = event.quantity!;
        sharedPreference.remove("cartItem");
        sendData(item: item, keyName: "cartItem");
        print("ITEM in else : $item");
      }
      emit(CartState(cartItem: item));
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
    print("Sendded dataaaaa");
    final sharedPreference = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(item);
    await sharedPreference.setString(keyName, encodedData);
  }

  List<dynamic> getData(
      {required String keyName, required final sharedPreference}) {
    dynamic data = sharedPreference.getString(keyName);
    data = jsonDecode(data);
    return data;
  }
}
