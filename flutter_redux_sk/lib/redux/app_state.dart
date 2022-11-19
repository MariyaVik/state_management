import 'package:flutter/foundation.dart';
import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/models/product.dart';

@immutable
class AppState {
  final List<Product> products;
  final bool isLoading;
  final AppTab tab;
  final List<Product> favorites;
  final Map<Product, int> cart;

  const AppState(
      {required this.products,
      required this.isLoading,
      required this.tab,
      required this.favorites,
      required this.cart});
}
