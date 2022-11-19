import 'package:flutter_redux_sk/models/product.dart';

abstract class CartAction {
  final Product product;

  const CartAction({required this.product});
}

class AddToCartAction extends CartAction {
  const AddToCartAction({required super.product});
}

class ReduceFromCartAction extends CartAction {
  const ReduceFromCartAction({required super.product});
}

class RemoveFromCartAction extends CartAction {
  const RemoveFromCartAction({required super.product});
}
