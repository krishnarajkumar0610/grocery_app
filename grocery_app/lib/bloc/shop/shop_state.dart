import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable {}

class DummyShopState extends ShopState {
  @override
  List<Object?> get props => [];
}

class GetInitialShopItemState extends ShopState {
  List shopItems;

  GetInitialShopItemState({required this.shopItems});

  @override
  List<Object?> get props => [];
}

class GetGreetingsState extends ShopState {
  String greeting;

  GetGreetingsState({required this.greeting});

  @override
  List<Object?> get props => [];
}
