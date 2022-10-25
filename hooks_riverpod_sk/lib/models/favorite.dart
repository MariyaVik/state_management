import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_sk/models/product.dart';

class FavoriteModel extends StateNotifier<List<Product>> {
  FavoriteModel() : super([]);

  void add(Product product) {
    state = [...state, product];
  }

  void remove(Product product) {
    state = [
      for (final pr in state)
        if (pr.id != product.id) pr,
    ];
  }
}
