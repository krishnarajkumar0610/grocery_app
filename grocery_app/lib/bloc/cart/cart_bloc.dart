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
      List<dynamic> datas = event.shopItems[event.index];
      List carItem = [];
      datas[0] = event.quantity;
      final sharedPreference = await SharedPreferences.getInstance();
      if (!sharedPreference.containsKey("cartItem")) {
        carItem.add(datas);
        print(datas);
        sendData(item: [datas], keyName: "cartItem");
      } else {
        carItem =
            getData(keyName: "cartItem", sharedPreference: sharedPreference);
        carItem.add(datas);
        print("inside the else : ${carItem}");
        sharedPreference.remove("cartItem");
        sendData(item: carItem, keyName: "cartItem");
      }
      emit((CartState(cartItem: carItem)));
    });

    on<RemoveItem>((event, emit) async {
      final sharedPreference = await SharedPreferences.getInstance();
      List cartItem =
          getData(keyName: "cartItem", sharedPreference: sharedPreference);
      print("In remove : $cartItem");
      emit(CartState(cartItem: cartItem));
    });
  }

  void sendData({required final item, required String keyName}) async {
    // print("*" * 30);
    // print("RECEIVED AS : ${item.runtimeType}");
    // print("*" * 30);
    // for (var datas in item) {
    //   print("Datas : ${datas.runtimeType}");
    //   for (var data in datas) {
    //     print("Item $data : ${data.runtimeType}");
    //   }
    // }
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
