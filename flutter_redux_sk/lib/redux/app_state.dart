import 'package:flutter/foundation.dart';
import 'package:flutter_redux_sk/models/product.dart';

@immutable
class AppState {
  final List<Product> products;
  final bool isLoading;

  const AppState({required this.products, required this.isLoading});
}
