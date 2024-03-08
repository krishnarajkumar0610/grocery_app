class ShopEvent {}

class GetInitialShopItem extends ShopEvent {}

class EditShopItems extends ShopEvent {
  final shopItems;
  String itemPrice;
  String itemName;
  int index;

  EditShopItems(
      {required this.shopItems,
      required this.itemName,
      required this.itemPrice,
      required this.index});
}

class AddNewItemsInShop extends ShopEvent {}

class ChangeToCheckmark extends ShopEvent {
  int index;
  List shopItem;

  ChangeToCheckmark({required this.index, required this.shopItem});
}

class ChangeToShopCart extends ShopEvent {
  String itemName;
  List shopItem;

  ChangeToShopCart({required this.itemName, required this.shopItem});
}

class ChangeAllIcon extends ShopEvent {
  List shopItem;

  ChangeAllIcon({required this.shopItem});
}
