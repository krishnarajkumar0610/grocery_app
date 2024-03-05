class CartEvents {}

class GetInitialCartData extends CartEvents {}

class Clearcart extends CartEvents {}

class AddToCart extends CartEvents {
  int? index;
  List? shopItems;

  AddToCart({this.index, this.shopItems});
}

class RemoveItem extends CartEvents {
  int? index; // this will store the index value
  RemoveItem({this.index});
}
