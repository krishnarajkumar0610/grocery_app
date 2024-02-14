class GrossEvents {}

class AddToCart extends GrossEvents {
  int? index;

  AddToCart({this.index});
}

class RemoveItem extends GrossEvents {
  int? index; // this will store the index value
  List localCarts;
  bool? themeStatus;
  RemoveItem({this.index, required this.localCarts,this.themeStatus
  });
}

class ChangeTheme extends GrossEvents {
  bool? themeStatus;
  final List? cartItems;
  ChangeTheme({this.themeStatus,this.cartItems}) {
    print("VANTEA");
  }
}