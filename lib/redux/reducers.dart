import 'actions.dart';
import 'model.dart';

List<CartItem> appReducers(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return List.from(items)..add(action.item);
}

List<CartItem> toggleItemState(
    List<CartItem> items, ToggleItemStateAction action) {
  return items
      .map(
          (CartItem item) => item.name == action.item.name ? action.item : item)
      .toList();
}
