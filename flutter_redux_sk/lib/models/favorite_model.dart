import 'package:flutter_redux_sk/models/product.dart';

class FavoriteModel {
  final List<Product> products;

  const FavoriteModel({this.products = const <Product>[]});

  void add(Product product) {
    products.add(product);
  }

  void remove(Product product) {
    products.remove(product);
  }

//   @override
//   List<Object?> get props => [products];
}
