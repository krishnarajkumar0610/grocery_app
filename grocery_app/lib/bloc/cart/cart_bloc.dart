import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(CartState(cartItem: [], totalAmount: 0)) {
    on<Clearcart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("cartItem");
      emit(CartState(cartItem: [], totalAmount: 0));
    });

    on<GetInitialCartData>((event, emit) async {
      int totalAmount = 0;
      final sharedPreference = await SharedPreferences.getInstance();
      final List cartItems;
      if (!sharedPreference.containsKey("cartItem")) {
        cartItems = [];
        sendData(item: cartItems, keyName: "cartItem");
      } else {
        cartItems =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
      }
      totalAmount = getTotalAmount(cartItems: cartItems);
      emit(CartState(cartItem: cartItems, totalAmount: totalAmount));
    });

    on<AddToCart>((event, emit) async {
      List<dynamic> datas = event.shopItems[event.index];
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem = [];
      datas[0] = event.quantity;
      int totalAmount = 0;
      if (!sharedPreference.containsKey("cartItem")) {
        cartItem.add(datas);
        totalAmount = datas[0] * datas[2];
        sendData(item: [datas], keyName: "cartItem");
      } else {
        cartItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
        String itemName = datas[1];
        totalAmount = getTotalAmount(cartItems: cartItem);
        totalAmount = removeAmount(
            cartItem: cartItem, itemName: itemName, totalAmount: totalAmount);
        cartItem.add(datas);
        totalAmount += cartItem[cartItem.length - 1][0] *
            cartItem[cartItem.length - 1][2] as int;
        sharedPreference.remove("cartItem");
        sendData(item: cartItem, keyName: "cartItem");
      }
      emit((CartState(cartItem: cartItem, totalAmount: totalAmount)));
    });

    on<RemoveItem>((event, emit) async {
      int totalAmount = state.totalAmount!;
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem =
          getData(keyName: "cartItem", sharedPreference: sharedPreference);
      totalAmount -= cartItem[event.index][0] * cartItem[event.index][2] as int;
      cartItem.removeAt(event.index);
      sharedPreference.remove("cartItem");
      sendData(item: cartItem, keyName: "cartItem");
      emit(CartState(cartItem: cartItem, totalAmount: totalAmount));
    });
  }

  void sendData({required final item, required String keyName}) async {
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
