import 'package:flutter_mobx_sk/models/product.dart';
import 'package:mobx/mobx.dart';

part 'favorites.g.dart';

class FavoritesState = _FavoritesState with _$FavoritesState;

abstract class _FavoritesState with Store {
  @observable
  List<Product> favorites =
      ObservableList(); // почему сердечно сразу не меняется с []

  @action
  void addProduct(Product product) => favorites.add(product);

  @action
  void removeProduct(Product product) => favorites.remove(product);
}
