abstract class CartEvents {}

class GetInitialCartDataEvent extends CartEvents {}

class ClearCartItemsEvent extends CartEvents {}

class AddToCartEvent extends CartEvents {
  int index;
  List shopItems;
  int quantity;

  AddToCartEvent({
    required this.index,
    required this.shopItems,
    required this.quantity,
  });
}

class RemoveItemFomCartEvent extends CartEvents {
  int index; // this will store the index value
  int amount;

  RemoveItemFomCartEvent({required this.index, required this.amount});
}
