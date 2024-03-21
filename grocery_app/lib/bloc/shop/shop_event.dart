abstract class ShopEvents {}

class ShopItemEvent extends ShopEvents {}

class InitialShopStateLoading extends ShopEvents {}

class AddItemInShopEvent extends ShopEvents {
  String itemName;
  String itemPrice;

  AddItemInShopEvent({required this.itemName, required this.itemPrice});
}
