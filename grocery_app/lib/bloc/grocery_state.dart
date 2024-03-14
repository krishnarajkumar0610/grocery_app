import 'package:equatable/equatable.dart';

abstract class GroceryState extends Equatable {}

// theme
class LightThemeState extends GroceryState {
  @override
  List<Object?> get props => [];
}

class DarkThemeState extends GroceryState {
  @override
  List<Object?> get props => [];
}

// ______________________________________________________________

// greeting

class GreetingState extends GroceryState {
  String greeting;

  GreetingState({required this.greeting});

  @override
  List<Object?> get props => [];
}

// ______________________________________________________________

// cart

class CartState extends GroceryState {
  List? cartItem;
  int? totalAmount;

  CartState({this.cartItem, this.totalAmount});

  @override
  List<Object?> get props => [];
}

// ______________________________________________________________

// shop

class InitialShopState extends GroceryState {
  List shopItems;
  bool? checkNameAndPrice;

  InitialShopState({required this.shopItems, this.checkNameAndPrice});

  @override
  List<Object?> get props => [];
}

//______________________________________________________________

class ValidationSuccess extends GroceryState {
  bool isAdmin;

  ValidationSuccess({required this.isAdmin});

  @override
  List<Object?> get props => [];
}

class ValidationFailure extends GroceryState {
  @override
  List<Object?> get props => [];
}
//
