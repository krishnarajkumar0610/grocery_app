import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class DummyCartState extends CartState {
  @override
  List<Object?> get props => [];
}

class LoadingCartState extends CartState {
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
