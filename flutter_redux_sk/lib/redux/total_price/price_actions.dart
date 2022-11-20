import 'package:flutter_redux_sk/models/product.dart';

class PriceLoadAction {
  final Map<Product, int> cart;
  PriceLoadAction({required this.cart});
}
