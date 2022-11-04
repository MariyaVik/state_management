part of 'cart_bloc.dart';

class CartState {
  Map<Product, int> cart;

  CartState({required this.cart});
}

class CartEmptyState extends CartState {
  CartEmptyState() : super(cart: {});
}
