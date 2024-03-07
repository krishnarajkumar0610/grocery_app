class ShopEvent {}

class GetInitialShopItem extends ShopEvent {}

class UpdateShopItems extends ShopEvent {
  final shopItems;

  UpdateShopItems({required this.shopItems});
}

class AddToShopItem extends ShopEvent {}
