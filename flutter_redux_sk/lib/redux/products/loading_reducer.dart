import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, ProductsSuccessAction>(_setLoaded),
  TypedReducer<bool, ProductsErrorAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
