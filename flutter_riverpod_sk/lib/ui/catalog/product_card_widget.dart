import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sk/models/product.dart';
import 'package:flutter_riverpod_sk/ui/cart/plus_minus_widget.dart';
import 'package:flutter_riverpod_sk/ui/home_screen.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({required this.product, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthItem = MediaQuery.of(context).size.width / 2 - 12;
    return SizedBox(
      width: widthItem,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: widthItem,
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
      ),
    );
  }
}

class AddToCartButton extends ConsumerWidget {
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
                ref.read(cartProvider).add(product);
              },
              child: const Text('В корзину'));
    });
  }
}

class FavoriteButton extends ConsumerWidget {
  final Product product;
  const FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isInFavorite = ref.watch(favoriteProvider.select(
      (favorites) => favorites.contains(product),
    ));

    return IconButton(
      splashRadius: null,
      icon: Icon(isInFavorite ? Icons.favorite_rounded : Icons.favorite_border),
      onPressed: isInFavorite
          ? () {
              ref.read(favoriteProvider.notifier).remove(product);
            }
          : () {
              ref.read(favoriteProvider.notifier).add(product);
            },
    );
  }
}
