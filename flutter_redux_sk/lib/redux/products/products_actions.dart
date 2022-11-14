import 'package:flutter_redux_sk/models/product.dart';

class ProductsLoadingAction {}

class ProductsSuccessAction {
  List<Product> products;
  ProductsSuccessAction({required this.products});
}

class ProductsErrorAction {}
