import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/favorites/favorites_actions.dart';
import 'package:redux/redux.dart';

final favoritesReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, AddFavoriteAction>(_add),
  TypedReducer<List<Product>, RemoveFavoriteAction>(_remove),
]);

List<Product> _add(List<Product> state, AddFavoriteAction action) {
  return [...state, action.product];
}

List<Product> _remove(List<Product> state, RemoveFavoriteAction action) {
  return [
    for (final pr in state)
      if (pr.id != action.product.id) pr
  ];
}
