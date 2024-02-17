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

  ChangeTheme({this.themeStatus});
}

class GreetingStatus extends GrossEvents {
  GreetingStatus() {
    print("Inside the Greeting status");
  }
}

class AddQuantity extends GrossEvents {
  int? quantity;

  AddQuantity({this.quantity});
}
