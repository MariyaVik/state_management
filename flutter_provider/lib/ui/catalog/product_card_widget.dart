import 'package:flutter/material.dart';
import 'package:flutter_provider/models/favorite.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:provider/provider.dart';

// class ProductCardWidget extends StatefulWidget {
//   Product product;
//   ProductCardWidget({required this.product, Key? key}) : super(key: key);

//   @override
//   State<ProductCardWidget> createState() => _ProductCardWidgetState();
// }

class ProductCardWidget extends StatelessWidget {
  Product product;
  ProductCardWidget({required this.product, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Товар');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: MediaQuery.of(context).size.width / 2,
          child: Card(
            clipBehavior: Clip.hardEdge,
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  // loadingBuilder: (context, child, fgvd) =>
                  //     CircularProgressIndicator(),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                    child: FavoriteButton(
                      product: product,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: [
            Icon(Icons.star),
            Text(product.rating.rate.toString()),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 15,
              width: 1,
              color: Colors.black,
            ),
            Text(product.rating.count.toString()),
          ],
        ),
        Text('\u0024${product.price}'),
        ElevatedButton(onPressed: () {}, child: Text('В корзину')),
      ],
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final Product product;
  FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInFavorite = context.select<FavoriteModel, bool>(
        (favorites) => favorites.products.contains(product));
    print(isInFavorite);
    return IconButton(
      splashRadius: null,
      icon: isInFavorite
          ? const Icon(Icons.favorite_rounded)
          : const Icon(Icons.favorite_border),
      onPressed: isInFavorite
          ? () {
              print('удалили ${product.title}');

              var favorites = context.read<FavoriteModel>();
              print(favorites.products);
              favorites.remove(product);
              print(favorites.products);
            }
          : () {
              print('добавили ${product.title}');

              var favorites = context.read<FavoriteModel>();
              print(favorites.products);
              favorites.add(product);
              print(favorites.products);
            },
    );
  }
}
