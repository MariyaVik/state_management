part of 'cart_bloc.dart';

abstract class CartState {
  Map<Product, int> cart;

  CartState({required this.cart});
}

class CartEmptyState extends CartState {
  CartEmptyState() : super(cart: {});
}

class CartWithItemsState extends CartState {
  CartWithItemsState({required super.cart});
}
