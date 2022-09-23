import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_sk/models/favorite.dart';
import 'package:flutter_riverpod_sk/ui/home_screen.dart';

import 'catalog/product_card_widget.dart';

class FavoriteList extends ConsumerWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favorites = ref.watch(favoriteProvider);
    return favorites.products.isEmpty
        ? const Center(
            child: Text('Вы не добавили ничего в избранное'),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) =>
                  ProductCardWidget(product: favorites.products[index]),
              itemCount: favorites.products.length,
            ),
          );
  }
}
