import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart_model.dart';
import 'package:flutter_provider/models/favorite.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:flutter_provider/ui/cart/plus_minus_widget.dart';
import 'package:provider/provider.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({required this.product, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthItem = MediaQuery.of(context).size.width / 2 - 12;
    return SizedBox(
      width: widthItem,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInCart = context
        .select<CartModel, bool>((cart) => cart.products.containsKey(product));
    var cart = context.read<CartModel>();
    return isInCart
        ? Consumer<CartModel>(
            builder: (context, value, child) =>
                PlusMinusWidget(product: product),
          )
        : ElevatedButton(
            onPressed: () {
              cart.add(product);
            },
            child: const Text('В корзину'));
  }
}

class FavoriteButton extends StatelessWidget {
  final Product product;
  const FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInFavorite = context.select<FavoriteModel, bool>(
        (favorites) => favorites.products.contains(product));
    return IconButton(
      splashRadius: null,
      icon: isInFavorite
          ? const Icon(Icons.favorite_rounded)
          : const Icon(Icons.favorite_border),
      onPressed: isInFavorite
          ? () {
              var favorites = context.read<FavoriteModel>();
              favorites.remove(product);
            }
          : () {
              var favorites = context.read<FavoriteModel>();
              favorites.add(product);
            },
    );
  }
}
