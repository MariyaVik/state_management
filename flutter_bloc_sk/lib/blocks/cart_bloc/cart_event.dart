part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  final Product product;

  const CartEvent({required this.product});
}

class AddProductToCart extends CartEvent {
  const AddProductToCart({required super.product});
}

class ReduceProductFromCart extends CartEvent {
  const ReduceProductFromCart({required super.product});
}

class RemoveProductFromCart extends CartEvent {
  const RemoveProductFromCart({required super.product});
}
