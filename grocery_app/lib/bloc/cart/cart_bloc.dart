import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  CartBloc() : super(CartState(cartItem: [], iconStatus: true)) {
    on<Clearcart>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      sharedPreference.remove("cartItem");
      emit(CartState(cartItem: [], iconStatus: true));
    });

    on<AddToCart>((event, emit) async {
      List<dynamic> datas = event.shopItems[event.index];
      List cartItem = [];
      datas[0] = event.quantity;
      final sharedPreference = await SharedPreferences.getInstance();
      if (!sharedPreference.containsKey("cartItem")) {
        cartItem.add(datas);
        sendData(item: [datas], keyName: "cartItem");
      } else {
        cartItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
        String itemname = datas[1];
        for (int i = 0; i < cartItem.length; i++) {
          if (cartItem[i][1] == itemname) {
            print("Item name : ${cartItem[i][1]}");
            print("removed");
            cartItem.removeAt(i);
            print(cartItem);
            break;
          }
        }
        cartItem.add(datas);
        sharedPreference.remove("cartItem");
        sendData(item: cartItem, keyName: "cartItem");
      }
      emit((CartState(cartItem: cartItem, iconStatus: true)));
    });

    on<RemoveItem>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem =
          getData(keyName: "cartItem", sharedPreference: sharedPreference);
      print("In remove : $cartItem");
      emit(CartState(cartItem: cartItem, iconStatus: true));
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
}
