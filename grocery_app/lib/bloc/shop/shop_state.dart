import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable {}

class InitialShopState extends ShopState {
  List shopItems;

  InitialShopState({required this.shopItems});

  @override
  List<Object?> get props => [];
}

class DummyShop extends ShopState {
  @override
  List<Object?> get props => [];
}

class ImageNotFound extends ShopState {
  @override
  List<Object?> get props => [];
}

class BuyItemState extends ShopState {
  @override
  List<Object?> get props => [];
}
