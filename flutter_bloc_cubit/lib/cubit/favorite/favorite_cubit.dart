import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/models/product.dart';

class FavoriteCubit extends Cubit<List<Product>> {
  FavoriteCubit() : super([]);

  void add(Product product) {
    emit([...state, product]);
  }

  void remove(Product product) {
    emit([
      for (final pr in state)
        if (pr.id != product.id) pr,
    ]);
  }
}
