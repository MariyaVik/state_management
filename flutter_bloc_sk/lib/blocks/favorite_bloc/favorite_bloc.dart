import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sk/models/product.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    on<AddProductToFavorite>(_addProduct);
    on<RemoveProductFromFavorite>(_removeProduct);
  }

  _addProduct(AddProductToFavorite event, Emitter<FavoriteState> emit) {
    emit(FavoriteState(favorites: [...state.favorites, event.product]));
  }

  _removeProduct(RemoveProductFromFavorite event, Emitter<FavoriteState> emit) {
    emit(FavoriteState(favorites: [
      for (final pr in state.favorites)
        if (pr.id != event.product.id) pr
    ]));
  }
}
