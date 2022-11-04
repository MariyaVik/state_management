import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sk/models/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartEmptyState()) {
    on<AddProductToCart>(_add);
    on<ReduceProductFromCart>(_reduce);
    on<RemoveProductFromCart>(_remove);
  }

  double get totalPrice => state.cart.keys.fold(
      0, (total, current) => total + current.price * state.cart[current]!);

  _add(AddProductToCart event, emit) {
    if (state.cart.containsKey(event.product)) {
      state.cart[event.product] = state.cart[event.product]! + 1;
    } else {
      state.cart[event.product] = 1;
    }
    emit(CartState(cart: state.cart));
  }

  _reduce(CartEvent event, emit) {
    if (state.cart[event.product] == 1) {
      _remove(event, emit);
    } else {
      state.cart[event.product] = state.cart[event.product]! - 1;
      emit(CartState(cart: state.cart));
    }
  }

  _remove(CartEvent event, emit) {
    state.cart.remove(event.product);
    if (state.cart.isEmpty) {
      emit(CartEmptyState());
    } else {
      emit(CartState(cart: state.cart));
    }
  }
}
