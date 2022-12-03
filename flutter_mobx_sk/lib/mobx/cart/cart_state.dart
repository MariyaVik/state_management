import 'package:flutter_mobx_sk/models/product.dart';
import 'package:mobx/mobx.dart';

part 'cart_state.g.dart';

class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  @observable
  Map<Product, int> cart = ObservableMap(); //{};

  @computed
  double get totalPrice => cart.keys
      .fold(0, (total, current) => total + current.price * cart[current]!);

  @action
  void addProduct(Product product) => cart.containsKey(product)
      ? cart[product] = cart[product]! + 1
      : cart[product] = 1;

  @action
  void removeProduct(Product product) => cart.remove(product);

  @action
  void reduceProduct(Product product) {
    if (cart[product]! > 1) {
      cart[product] = cart[product]! - 1;
    } else {
      removeProduct(product);
    }
  }
}
