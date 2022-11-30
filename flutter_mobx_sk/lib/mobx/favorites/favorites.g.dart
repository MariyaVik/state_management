// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesState on _FavoritesState, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoritesState.favorites', context: context);

  @override
  List<Product> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Product> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$_FavoritesStateActionController =
      ActionController(name: '_FavoritesState', context: context);

  @override
  void addProduct(Product product) {
    final _$actionInfo = _$_FavoritesStateActionController.startAction(
        name: '_FavoritesState.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_FavoritesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo = _$_FavoritesStateActionController.startAction(
        name: '_FavoritesState.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_FavoritesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
