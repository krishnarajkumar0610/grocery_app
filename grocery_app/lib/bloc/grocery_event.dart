abstract class GroceryEvent {}

// greeting

class GreetingEvent extends GroceryEvent {}

// ______________________________________________________________

// theme

class ChangeTheme extends GroceryEvent {}

//______________________________________________________________

// cart

class GetInitialCartData extends GroceryEvent {}

class Clearcart extends GroceryEvent {}

class AddToCart extends GroceryEvent {
  int index;
  List shopItems;
  int quantity;

  AddToCart({
    required this.index,
    required this.shopItems,
    required this.quantity,
  });
}

class RemoveItem extends GroceryEvent {
  int index; // this will store the index value

  RemoveItem({required this.index});
}

// ______________________________________________________________

// shop

class GetInitialShopItem extends GroceryEvent {}

class EditShopItems extends GroceryEvent {
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

class AddNewItemsInShop extends GroceryEvent {
  String itemName;
  String itemPrice;
  List shopItem;

  AddNewItemsInShop(
      {required this.itemName,
      required this.itemPrice,
      required this.shopItem});
}

class ChangeToCheckmark extends GroceryEvent {
  int index;
  List shopItem;

  ChangeToCheckmark({required this.index, required this.shopItem});
}

class ChangeToShopCart extends GroceryEvent {
  String itemName;
  List shopItem;

  ChangeToShopCart({required this.itemName, required this.shopItem});
}

class ChangeAllIcon extends GroceryEvent {
  List shopItem;

  ChangeAllIcon({required this.shopItem});
}

class RemoveFromShop extends GroceryEvent {
  int index;
  List shopItem;

  RemoveFromShop({required this.index, required this.shopItem});
}

//______________________________________________________________

// validation

class SignUpEvent extends GroceryEvent {}

class SignInEvent extends GroceryEvent {
  String name;
  String password;

  SignInEvent({required this.name, required this.password});
}

//______________________________________________________________
