import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';

class ProductsLoadingAction {}

class ProductsSuccessAction {
  List<Product> products;
  ProductsSuccessAction({required this.products});
}

class ProductsErrorAction {}

class FiltrationProductsAction {
  AppState appState;
  FiltrationProductsAction({required this.appState});
}
