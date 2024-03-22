import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {}

class MyCartState extends CartState {
  List cartItem;

  MyCartState({
    required this.cartItem,
  });

  @override
  List<Object?> get props => [];
}

class DummyCart extends CartState {
  @override
  List<Object?> get props => [];
}
