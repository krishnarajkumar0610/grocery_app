import 'package:equatable/equatable.dart';

class CartState {}

class DummyCartState extends CartState {}

class LoadingCartState extends CartState {
}

class MyCartState extends CartState {
  List cartItem;
  int totalAmount;

  MyCartState({required this.cartItem, required this.totalAmount});
}
