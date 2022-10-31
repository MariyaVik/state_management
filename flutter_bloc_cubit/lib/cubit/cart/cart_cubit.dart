import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_cubit/models/product.dart';
import 'package:meta/meta.dart';

class CartCubit extends Cubit<Map<Product, int>> {
  CartCubit() : super({});
  double get totalPrice => state.keys
      .fold(0, (total, current) => total + current.price * state[current]!);

  void add(Product product) {
    if (state.containsKey(product)) {
      state[product] = state[product]! + 1;
    } else {
      state[product] = 1;
    }
    emit(Map.from(state));
  }

  void reduce(Product product) {
    if (state[product] == 1) {
      remove(product);
    } else {
      state[product] = state[product]! - 1;
      emit(Map.from(state));
    }
  }

  void remove(Product product) {
    state.remove(product);
    emit(Map.from(state));
  }
}
