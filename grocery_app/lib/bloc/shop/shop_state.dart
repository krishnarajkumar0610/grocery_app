import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable {}

class InitialShopState extends ShopState {
  List shopItems;
  bool? checkNameAndPrice;

  InitialShopState({required this.shopItems, this.checkNameAndPrice});

  @override
  List<Object?> get props => [];
}

class DummyShop extends ShopState {
  @override
  List<Object?> get props => [];
}
