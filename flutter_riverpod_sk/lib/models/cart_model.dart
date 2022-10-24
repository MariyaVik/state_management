import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sk/models/product.dart';

class CartModel extends StateNotifier<Map<Product, int>> {
  CartModel() : super({});

  double get totalPrice => state.keys
      .fold(0, (total, current) => total + current.price * state[current]!);

  void add(Product product) {
    if (state.containsKey(product)) {
      state[product] = state[product]! + 1;
      state = Map.from(state);
    } else {
      state[product] = 1;
      state = Map.from(state);
    }
  }

  void reduce(Product product) {
    if (state[product] == 1) {
      remove(product);
    } else {
      state[product] = state[product]! - 1;
      state = Map.from(state);
    }
  }

  void remove(Product product) {
    state.remove(product);
    state = Map.from(state);
  }
}
