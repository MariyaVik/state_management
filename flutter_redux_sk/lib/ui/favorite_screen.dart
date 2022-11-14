import 'package:flutter/material.dart';

import 'catalog/product_card_widget.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<FavoriteBloc, FavoriteState>(builder: ((context, state) {
    //   int rowCount = state.favorites.length % 2 == 0
    //       ? state.favorites.length ~/ 2
    //       : (state.favorites.length ~/ 2) + 1;
    //   return state.favorites.isEmpty
    //       ? const Center(
    //           child: Text('Вы не добавили ничего в избранное'),
    //         )
    //       : Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: ListView.builder(
    //             itemBuilder: (context, index) => Padding(
    //               padding: const EdgeInsets.only(bottom: 8.0),
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   ProductCardWidget(product: state.favorites[index * 2]),
    //                   const SizedBox(width: 8),
    //                   if (index * 2 + 1 < state.favorites.length)
    //                     ProductCardWidget(
    //                         product: state.favorites[index * 2 + 1]),
    //                 ],
    //               ),
    //             ),
    //             itemCount: rowCount,
    //           ),
    //         );
    // }));
  }
}
