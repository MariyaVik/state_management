import 'package:flutter_redux_sk/models/product.dart';

class AddFavoriteAction {
  final Product product;

  AddFavoriteAction({required this.product});
}

class RemoveFavoriteAction {
  final Product product;

  RemoveFavoriteAction({required this.product});
}
