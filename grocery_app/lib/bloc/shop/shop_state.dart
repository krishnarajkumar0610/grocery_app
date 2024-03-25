class ShopState {}

class LoadingShopItemsState extends ShopState {}

class InitialShopState extends ShopState {
  List shopItems;

  InitialShopState({required this.shopItems});
}

class DummyShopState extends ShopState {}

class ItemNotFoundState extends ShopState {}

class ItemAddInShopSuccessState extends ShopState {}

class BuyItemState extends ShopState {}
