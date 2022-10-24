import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_sk/models/product.dart';
import 'package:hooks_riverpod_sk/ui/cart/plus_minus_widget.dart';
import 'package:hooks_riverpod_sk/ui/home_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({required this.product, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: MediaQuery.of(context).size.width / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
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
            const Icon(Icons.star),
            Text(product.rating.rate.toString()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 15,
              width: 1,
              color: Colors.black,
            ),
            Text(product.rating.count.toString()),
          ],
        ),
        Text('\u0024${product.price}'),
        AddToCartButton(
          product: product,
        ),
      ],
    );
  }
}

class AddToCartButton extends HookConsumerWidget {
  final Product product;
  const AddToCartButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      var cart = ref.watch(cartProvider);
      bool isInCart = cart.products.containsKey(product);
      return isInCart
          ? PlusMinusWidget(product: product)
          : ElevatedButton(
              onPressed: () {
                ref.read(cartProvider.notifier).add(product);
              },
              child: const Text('В корзину'));
    });
  }
}

class FavoriteButton extends HookConsumerWidget {
  final Product product;
  const FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      var favorites = ref.watch(favoriteProvider);
      bool isInFavorite = favorites.products.contains(product);
      return IconButton(
        splashRadius: null,
        icon: isInFavorite
            ? const Icon(Icons.favorite_rounded)
            : const Icon(Icons.favorite_border),
        onPressed: isInFavorite
            ? () {
                ref.read(favoriteProvider.notifier).remove(product);
              }
            : () {
                ref.read(favoriteProvider.notifier).add(product);
              },
      );
    });
  }
}