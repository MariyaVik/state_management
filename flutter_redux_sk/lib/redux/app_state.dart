import 'package:flutter/foundation.dart';
import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/models/product.dart';

@immutable
class AppState {
  final List<Product> products;
  final bool isLoading;
  final AppTab tab;

  const AppState(
      {required this.products, required this.isLoading, required this.tab});
}
