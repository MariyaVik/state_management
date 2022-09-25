import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod_sk/models/product.dart';

class CartModel extends ChangeNotifier {
  final Map<Product, int> products = {};
  double get totalPrice => products.keys
      .fold(0, (total, current) => total + current.price * products[current]!);

  void add(Product product) {
    if (products.containsKey(product)) {
      products[product] = products[product]! + 1;
    } else {
      products[product] = 1;
    }

    notifyListeners();
  }

  void reduce(Product product) {
    if (products[product] == 1) {
      remove(product);
    } else {
      products[product] = products[product]! - 1;
    }
    notifyListeners();
  }

  void remove(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
