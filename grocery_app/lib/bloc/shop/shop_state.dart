import 'package:equatable/equatable.dart';

abstract class ShopState extends Equatable {}

class GetInitialShopItemState extends ShopState {
  List shopItems;

  GetInitialShopItemState({required this.shopItems});

  @override
  List<Object?> get props => [];
}

class InitialShopEvent extends ShopState {
  @override
  List<Object?> get props => [];
}

class ImageNotFound extends ShopState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
