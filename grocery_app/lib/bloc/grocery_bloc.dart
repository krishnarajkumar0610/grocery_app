import 'package:flutter_bloc/flutter_bloc.dart';

import 'grocery_events.dart';
import 'grocery_states.dart';

class GroceryBloc extends Bloc<GrossEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {
    on<AddToCart>((event, emit) async {
      // add item event
      int? index = event.index;
      state.cartItems?.add(state.shopItems[index!]);
    });

    on<RemoveItem>((event, emit) async {
      // remove item event
      List localCarts = event.localCarts;
      int index = event.index!;
      localCarts.removeAt(index);
      emit(GroceryStates(cartItems: localCarts));
    });

    on<ChangeTheme>((event, emit) async {
      // remove item event
      var theme = event.themeStatus!;
      theme = !theme;
      List localCarts = event.cartItems!;
      emit(GroceryStates(themeStatus: theme, cartItems: localCarts));
    });
  }
}
