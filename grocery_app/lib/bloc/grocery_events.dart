class GroceryEvents {}

class AddToCart extends GroceryEvents {
  int? index;

  AddToCart({this.index});
}

class RemoveItem extends GroceryEvents {
  int? index; // this will store the index value
  RemoveItem({this.index});
}

class ChangeTheme extends GroceryEvents {
  bool? themeStatus;
  bool fromLogout;

  ChangeTheme({this.themeStatus, this.fromLogout = false});
}

class GreetingStatus extends GroceryEvents {}

class AddQuantity extends GroceryEvents {
  int? quantity;

  AddQuantity({this.quantity});
}

class SignupValidation extends GroceryEvents {
  String? fullName;
  String? emailId;
  String? password;

  SignupValidation({this.fullName, this.emailId, this.password});
}
