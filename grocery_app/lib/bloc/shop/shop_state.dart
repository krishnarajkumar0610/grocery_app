import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable {}

class InitialShop extends ShopState {
  @override
  List<Object?> get props => [];
}

class GetInitialShopItemState extends ShopState {
  List shopItems;

  GetInitialShopItemState({required this.shopItems});

  @override
  List<Object?> get props => [];
}
