import 'package:get/get.dart';

import '../models/product.dart';

class FavoritesController extends GetxController {
  RxList<Product> favorites = <Product>[].obs;

  void addProduct(Product product) => favorites.add(product);

  void removeProduct(Product product) => favorites.remove(product);
}
