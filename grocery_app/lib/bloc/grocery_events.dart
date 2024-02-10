class GrossEvents {}
class AddItem extends GrossEvents {
  int? index;

  AddItem({this.index});
}

class RemoveItem extends GrossEvents {
  int? index;
  final localCarts;
  RemoveItem({this.index,required this.localCarts});

}

class CalculateTotalPrice extends GrossEvents {}


