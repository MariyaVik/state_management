import 'package:get/get.dart';

import '../models/filters.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class CatalogController extends GetxController {
  final APIService productsRepository;
  CatalogController(this.productsRepository) {
    loadProducts();
  }

  RxList<Product> products = <Product>[].obs;

  RxString error = ''.obs;

  var currentFilter = Filters.all.obs;

  RxBool get isLoading => (products.isEmpty && !hasError.value).obs;

  RxBool get hasError => (error.value != '').obs;

  RxList<Product> get filteredProducts => products
      .where((p) {
        switch (currentFilter.value) {
          case Filters.bacon:
            return p.category == FilterName.baconFilter;
          case Filters.pizza:
            return p.category == FilterName.pizzaFilter;
          case Filters.salad:
            return p.category == FilterName.saladFilter;
          default:
            return true;
        }
      })
      .toList()
      .obs;

  Future<void> loadProducts() async {
    products.value = await productsRepository
        .getAllProducts()
        .then((products) => products)
        .catchError((e) {
      error.value = e.toString();
      print(error);
      return <Product>[];
    });
  }
}
