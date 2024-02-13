import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priya_project/bloc/grocery_events.dart';
import 'package:priya_project/bloc/grocery_states.dart';

class GroceryBloc extends Bloc<GrossEvents, GroceryStates> {
  GroceryBloc() : super(GroceryStates(cartItems: [])) {
    on<AddItem>((event, emit) async {
      int? index = event.index;
      state.cartItems.add(state.shopItems[index!]);
    });
    on<RemoveItem>((event, emit) async {
      List localCarts = event.localCarts;
      int index = event.index!;
      localCarts.removeAt(index);

      emit(GroceryStates(cartItems: localCarts));
    });
  }
}
