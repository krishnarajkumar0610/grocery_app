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

class TimeStatus extends GrossEvents {}

class AddQantity extends GrossEvents {}
