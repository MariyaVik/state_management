import 'package:flutter_mobx_sk/models/filters.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:flutter_mobx_sk/services/api_service.dart';
import 'package:mobx/mobx.dart';

part 'products.g.dart';

class ProductsState = _ProductsState with _$ProductsState;

abstract class _ProductsState with Store {
  final APIService productsRepository;

  @observable
  List<Product> products = [];

  _ProductsState(this.productsRepository) {
    loadProducts();
  }

  @observable
  String error = '';

  @observable
  Filters currentFilter = Filters.all;

  @computed
  bool get isLoading => products.isEmpty && !hasError;
  @computed
  bool get hasError => error != '';

  @computed
  List<Product> get filteredProducts => products.where((p) {
        switch (currentFilter) {
          case Filters.bacon:
            return p.category == FilterName.baconFilter;
          case Filters.pizza:
            return p.category == FilterName.pizzaFilter;
          case Filters.salad:
            return p.category == FilterName.saladFilter;
          default:
            return true;
        }
      }).toList();

  @action
  Future<void> loadProducts() async {
    print('сейчас начнётся загрузка');
    products = await productsRepository
        .getAllProducts()
        .then((products) => products)
        .catchError((e) {
      error = e.toString();
      print(error);
      return <Product>[];
    });
  }
}
