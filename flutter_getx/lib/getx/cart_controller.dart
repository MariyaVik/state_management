import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  RxMap<Product, int> cart = <Product, int>{}.obs;

  double get totalPrice => cart.keys
      .fold(0, (total, current) => total + current.price * cart[current]!);

  void addProduct(Product product) => cart.containsKey(product)
      ? cart[product] = cart[product]! + 1
      : cart[product] = 1;

  void removeProduct(Product product) => cart.remove(product);

  void reduceProduct(Product product) {
    if (cart[product]! > 1) {
      cart[product] = cart[product]! - 1;
    } else {
      removeProduct(product);
    }
  }
}
