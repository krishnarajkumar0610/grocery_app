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
