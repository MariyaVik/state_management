import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../getx/favorites_controller.dart';
import 'catalog/product_card_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();

    return Obx(() {
      final favorites = Get.find<FavoritesController>().favorites;
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
