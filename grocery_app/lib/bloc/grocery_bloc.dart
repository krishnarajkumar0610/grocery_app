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
          themeStatus: state.themeStatus,
          totalAmount: state.totalAmount));
    });

    on<RemoveItem>((event, emit) {
      // remove item event
      List? cartItems = state.cartItems;
      int index = event.index!;
      cartItems?.removeAt(index);

      emit(GroceryStates(
          cartItems: cartItems,
          themeStatus: state.themeStatus,
          greetingStatus: state.greetingStatus,
          totalAmount: state.totalAmount));
    });

    on<ChangeTheme>((event, emit) {
      // changing theme
      var theme = event.themeStatus!;
      var fromLogout = event.fromLogout;
      if (fromLogout) {
        theme = true;
      } else {
        theme = !theme;
      }

      emit(GroceryStates(
          themeStatus: theme,
          cartItems: state.cartItems,
          greetingStatus: state.greetingStatus!,
          totalAmount: state.totalAmount));
    });

    on<GreetingStatus>((event, emit) {
      int hour = DateTime.now().hour;

      // Determine the time of day based on the hour
      String message;
      if (hour >= 6 && hour < 12) {
        message = 'Good Morning 🥞';
        print("PODAPODA ");
      } else if (hour >= 12 && hour < 16) {
        message = 'Good Afternoon 🍚';
      } else if (hour >= 16 && hour < 19) {
        message = 'Good Evening 🍟';
      } else {
        message = 'Good Night 🍜';
      }
      print(message);
      emit(GroceryStates(
          greetingStatus: message,
          cartItems: state.cartItems,
          themeStatus: state.themeStatus,
          totalAmount: state.totalAmount));
    });

    on<AddQuantity>((event, emit) {});
  }
}
