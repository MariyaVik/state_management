part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class AddProductToFavorite extends FavoriteEvent {
  final Product product;

  AddProductToFavorite({required this.product});
}

class RemoveProductFromFavorite extends FavoriteEvent {}
