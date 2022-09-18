import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_provider/models/favorite.dart';
import 'package:flutter_provider/ui/catalog/product_card_widget.dart';
import 'package:flutter_provider/ui/home_screen.dart';
import 'package:flutter_provider/ui/no_internet_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<FavoriteModel>();
    return ListView.builder(
      itemBuilder: (context, index) => Row(
        children: [
          Expanded(
              child: ProductCardWidget(product: favorites.products[index * 2])),
          if (favorites.products[index] != null)
            Expanded(
                child: ProductCardWidget(
                    product: favorites.products[index * 2 + 1])),
        ],
      ),
      itemCount:
          favorites.products.length ~/ 2 + 1 * favorites.products.length % 2,
    );
  }
}
