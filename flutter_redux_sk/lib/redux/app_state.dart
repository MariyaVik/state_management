import 'package:flutter/foundation.dart';
import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/models/filters.dart';
import 'package:flutter_redux_sk/models/product.dart';

@immutable
class AppState {
  final List<Product> products;
  final bool isLoading;
  final AppTab tab;
  final List<Product> favorites;
  final Map<Product, int> cart;
  final double totalPrice;
  final Filters filter;
  final List<Product> filteredProducts;

  const AppState(
      {required this.products,
      required this.isLoading,
      required this.tab,
      required this.favorites,
      required this.cart,
      required this.totalPrice,
      required this.filter,
      required this.filteredProducts});
}
