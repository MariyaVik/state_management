import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/favorite/favorite_cubit.dart';
import 'package:flutter_bloc_cubit/models/product.dart';

import 'catalog/product_card_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<Product>>(
        builder: ((context, state) {
      int rowCount =
          state.length % 2 == 0 ? state.length ~/ 2 : (state.length ~/ 2) + 1;
      return state.isEmpty
          ? const Center(
              child: Text('Вы не добавили ничего в избранное'),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductCardWidget(product: state[index * 2]),
                      const SizedBox(width: 8),
                      if (index * 2 + 1 < state.length)
                        ProductCardWidget(product: state[index * 2 + 1]),
                    ],
                  ),
                ),
                itemCount: rowCount,
              ),
            );
    }));
  }
}
