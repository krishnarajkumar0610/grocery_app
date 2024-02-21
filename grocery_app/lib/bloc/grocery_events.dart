class GrossEvents {}

class AddToCart extends GrossEvents {
  int? index;

  AddToCart({this.index});
}

class RemoveItem extends GrossEvents {
  int? index; // this will store the index value
  RemoveItem({this.index});
}

class ChangeTheme extends GrossEvents {
  bool? themeStatus;
  bool fromLogout;

  ChangeTheme({this.themeStatus, this.fromLogout = false});
}

class GreetingStatus extends GrossEvents { }

class AddQuantity extends GrossEvents {
  int? quantity;

  AddQuantity({this.quantity});
}
