import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/shop/shop_event.dart';
import 'package:grocery_app/bloc/shop/shop_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../methods.dart';

class ShopBloc extends Bloc<ShopEvents, ShopState> {
  ShopBloc() : super(DummyShopState()) {
    on<GetInitialShopItemsEvent>(getInitialShopItems);
    // on<AddNewItemsInShopEvent>(addNewItem);
  }

  Future<void> getInitialShopItems(
      GetInitialShopItemsEvent event, Emitter<ShopState> emit) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool containsKey = await checkKeyContains(
        keyName: "shopItems", sharedPreferences: sharedPreferences);
    List<dynamic> shopItems = [];
    //sharedPreferences.clear();
    if (containsKey) {
      sendListOfData(
          keyName: "shopItems", data: [], sharedPreferences: sharedPreferences);
      shopItems = getListOfData(
          keyName: "shopItems", sharedPreferences: sharedPreferences);
      print("shopItem : $shopItems");
    } else {
      shopItems = getListOfData(
          keyName: "shopItems", sharedPreferences: sharedPreferences);
    }
    emit(GetInitialShopItemState(shopItems: shopItems));
  }
}
