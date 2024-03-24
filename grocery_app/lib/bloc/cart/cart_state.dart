import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class LoadingCartItemsState extends CartState {
  @override
  List<Object?> get props => [];
}

class MyCartState extends CartState {
  List cartItem;
  int totalAmount;

  MyCartState({required this.cartItem, required this.totalAmount});

  @override
  List<Object?> get props => [];
}

class DummyCart extends CartState {
  @override
  List<Object?> get props => [];
}
