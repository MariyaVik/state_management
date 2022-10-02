import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sk/models/favorite_model.dart';
import 'package:flutter_bloc_sk/models/product.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState()) {
    on<AddProductToFavorite>(_addProduct);
  }

  _addProduct(AddProductToFavorite event, Emitter<FavoriteState> emit) {
    emit(FavoriteState(favorites: state.favorites..add(event.product)));
  }
}
