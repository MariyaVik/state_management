import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_sk/mobx/favorites/favorites.dart';
import 'package:provider/provider.dart';

import 'catalog/product_card_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();

    return Observer(builder: (context) {
      final favorites = Provider.of<FavoritesState>(context).favorites;
      int rowCount = favorites.length % 2 == 0
          ? favorites.length ~/ 2
          : (favorites.length ~/ 2) + 1;
      return favorites.isEmpty
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
                      ProductCardWidget(product: favorites[index * 2]),
                      const SizedBox(width: 8),
                      if (index * 2 + 1 < favorites.length)
                        ProductCardWidget(product: favorites[index * 2 + 1]),
                    ],
                  ),
                ),
                itemCount: rowCount,
              ),
            );
    });
  }
}
