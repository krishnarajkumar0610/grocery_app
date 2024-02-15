import 'package:flutter_bloc/flutter_bloc.dart';

import 'grocery_events.dart';
import 'grocery_states.dart';

class GroceryBloc extends Bloc<GrossEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {
    on<AddToCart>((event, emit) {
      // add item event
      int? index = event.index;
      state.cartItems?.add(state.shopItems[index!]);
      emit(GroceryStates(
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus,
          themeStatus: state.themeStatus));
    });

    on<RemoveItem>((event, emit) {
      // remove item event
      List? cartItems = state.cartItems;
      int index = event.index!;
      cartItems?.removeAt(index);

      emit(GroceryStates(
          cartItems: cartItems,
          themeStatus: state.themeStatus,
          greetingStatus: state.greetingStatus));
    });

    on<ChangeTheme>((event, emit) {
      // changing theme
      var theme = event.themeStatus!;
      theme = !theme;
      print("ENA DA ");
      emit(GroceryStates(
          themeStatus: theme,
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus!));
    });

    on<TimeStatus>((event, emit) {
      var hour = DateTime.now().hour;
      if (hour >= 6 && hour < 12) {
        emit(GroceryStates(
            greetingStatus: "Good Morning 🥞", cartItems: state.cartItems!,themeStatus: state.themeStatus));
      } else if (hour >= 12 && hour < 17) {
        emit(GroceryStates(
            greetingStatus: "Good Afternoon 🍚", cartItems: state.cartItems,themeStatus: state.themeStatus));
      } else if (hour >= 17 && hour < 19) {
        emit(GroceryStates(
            greetingStatus: "Good Evening 🍫", cartItems: state.cartItems,themeStatus: state.themeStatus));
      } else {
        emit(GroceryStates(
            greetingStatus: "Good Night 🍜", cartItems: state.cartItems,themeStatus: state.themeStatus));
      }
    });

    on<AddQuantity>((event, emit) async {
      var quantity = event.quantity!;
      quantity++;
      print("Inside the Quantity event $quantity");

      emit(GroceryStates(
        cartItems: state.cartItems,
        quantity: quantity,
        greetingStatus: state.greetingStatus,
        themeStatus: state.themeStatus,
      ));
    });
  }
}
