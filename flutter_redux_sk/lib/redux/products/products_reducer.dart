import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<List<Product>>([
  TypedReducer<List<Product>, ProductsSuccessAction>(_success),
  TypedReducer<List<Product>, ProductsErrorAction>(_error),
]);

List<Product> _success(List<Product> state, ProductsSuccessAction action) {
  return action.products;
}

List<Product> _error(List<Product> state, ProductsErrorAction action) {
  return [];
}
