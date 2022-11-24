import 'package:flutter_redux_sk/models/filters.dart';
import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:redux/redux.dart';

final filteredProductsReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, FiltrationProductsAction>(_filtration),
]);

List<Product> _filtration(
    List<Product> state, FiltrationProductsAction action) {
  return action.appState.products.where((p) {
    var filter = action.appState.filter;
    switch (filter) {
      case Filters.bacon:
        return p.category == FilterName.baconFilter;
      case Filters.pizza:
        return p.category == FilterName.pizzaFilter;
      case Filters.salad:
        return p.category == FilterName.saladFilter;
      default:
        return true;
    }
  }).toList();
}
