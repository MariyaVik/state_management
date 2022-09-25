import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod_sk/models/product.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Product> products = [];

  void add(Product product) {
    products.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
