import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/cart/cart_actions.dart';
import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:flutter_redux_sk/redux/products/products_middleware.dart';
import 'package:flutter_redux_sk/redux/total_price/price_middleware.dart';
import 'package:flutter_redux_sk/services/api_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appMiddleware() {
  final productsRepo = APIService();
  return [
    TypedMiddleware<AppState, ProductsLoadingAction>(
        loadProducts(productsRepo)),
    TypedMiddleware<AppState, CartAction>(changeTotalPrice()),
  ];
}
