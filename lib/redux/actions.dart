import 'model.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class ToggleItemStateAction {
  final CartItem item;

  ToggleItemStateAction(this.item);
}
