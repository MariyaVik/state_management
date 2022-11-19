import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/cart/cart_actions.dart';
import 'package:redux/redux.dart';

final cartReducer = combineReducers<Map<Product, int>>([
  TypedReducer<Map<Product, int>, AddToCartAction>(_add),
  TypedReducer<Map<Product, int>, RemoveFromCartAction>(_remove),
  TypedReducer<Map<Product, int>, ReduceFromCartAction>(_reduce),
]);

Map<Product, int> _add(Map<Product, int> state, AddToCartAction action) {
  Map<Product, int> map = {};
  map.addAll(state);
  if (map.containsKey(action.product)) {
    map[action.product] = map[action.product]! + 1;
  } else {
    map[action.product] = 1;
  }
  return map;
}

Map<Product, int> _remove(Map<Product, int> state, CartAction action) {
  Map<Product, int> map = {};
  map.addAll(state);
  map.remove(action.product);
  if (map.isEmpty) {
    return {};
  } else {
    return map;
  }
}

Map<Product, int> _reduce(Map<Product, int> state, CartAction action) {
  if (state[action.product] == 1) {
    return _remove(state, action);
  } else {
    Map<Product, int> map = {};
    map.addAll(state);
    map[action.product] = map[action.product]! - 1;
    return map;
  }
}
