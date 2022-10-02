import 'package:flutter_bloc_sk/models/product.dart';
import 'package:equatable/equatable.dart';

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
