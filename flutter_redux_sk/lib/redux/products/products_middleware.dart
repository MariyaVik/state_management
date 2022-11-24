import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:flutter_redux_sk/services/api_service.dart';
import 'package:redux/redux.dart';

Middleware<AppState> loadProducts(APIService repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository
        .getAllProducts()
        .then((products) => store.dispatch(
              ProductsSuccessAction(
                products: products,
              ),
            ))
        .catchError((_) => store.dispatch(ProductsErrorAction()));

    next(action);
  };
}

Middleware<AppState> filterProducts() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    store.dispatch(FiltrationProductsAction(appState: store.state));
  };
}
