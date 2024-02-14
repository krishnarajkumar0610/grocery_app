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
      List? cartItems = state.cartItems;
      int index = event.index!;
      cartItems?.removeAt(index);

      emit(GroceryStates(
          cartItems: cartItems,
          themeStatus: state.themeStatus,
          greetingStatus: state.greetingStatus));
    });

    on<ChangeTheme>((event, emit) async {
      // changing theme
      var theme = event.themeStatus!;
      theme = !theme;
      print("ENA DA ");
      emit(GroceryStates(
          themeStatus: theme,
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus!));
    });

    on<TimeStatus>((event, emit) async {
      var hour = DateTime.now().hour;
      if (hour >= 6 && hour < 12) {
        emit(GroceryStates(
            greetingStatus: "Good Morning 🥞", cartItems: state.cartItems!));
      } else if (hour >= 12 && hour < 17) {
        emit(GroceryStates(
            greetingStatus: "Good Afternoon 🍚", cartItems: state.cartItems));
      } else if (hour >= 17 && hour < 19) {
        emit(GroceryStates(
            greetingStatus: "Good Evening 🍫", cartItems: state.cartItems));
      } else {
        emit(GroceryStates(
            greetingStatus: "Good Night 🍜", cartItems: state.cartItems));
      }
    });
  }
}
