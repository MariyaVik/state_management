import 'package:flutter_bloc_sk/models/product.dart';

class FavoriteModel {
  final List<Product> products = [];

  void add(Product product) {
    products.add(product);
  }

  void remove(Product product) {
    products.remove(product);
  }
}
