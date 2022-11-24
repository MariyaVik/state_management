import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:flutter_mobx_sk/ui/cart/plus_minus_widget.dart';

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
          ImageStack(width: widthItem, product: product),
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
          const SizedBox(height: 5),
          AddToCartButton(product: product),
        ],
      ),
    );
  }
}

class ImageStack extends StatelessWidget {
  const ImageStack({
    Key? key,
    required this.width,
    required this.product,
  }) : super(key: key);

  final double width;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              // loadingBuilder: (context, child, fgvd) =>
              //     const Center(child: CircularProgressIndicator()),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
                child: FavoriteButton(product: product),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text('В корзину'));
    // return StoreConnector<AppState, Map<Product, int>>(
    //   converter: (store) => store.state.cart,
    //   builder: (context, cart) {
    //     bool isInCart = cart.containsKey(product);
    //     return isInCart
    //         ? PlusMinusWidget(product: product)
    //         : ElevatedButton(
    //             onPressed: () => StoreProvider.of<AppState>(context)
    //                 .dispatch(AddToCartAction(product: product)),
    //             child: const Text('В корзину'));
    //   },
    // );
  }
}

class FavoriteButton extends StatelessWidget {
  final Product product;
  const FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.favorite));
    // return StoreConnector<AppState, List<Product>>(
    //     converter: (store) => store.state.favorites,
    //     builder: ((context, favorites) {
    //       bool isInFavorite = favorites.contains(product);

    //       return IconButton(
    //         splashRadius: null,
    //         icon: Icon(
    //             isInFavorite ? Icons.favorite_rounded : Icons.favorite_border),
    //         onPressed: isInFavorite
    //             ? () => StoreProvider.of<AppState>(context)
    //                 .dispatch(RemoveFavoriteAction(product: product))
    //             : () => StoreProvider.of<AppState>(context)
    //                 .dispatch(AddFavoriteAction(product: product)),
    //       );
    //     }));
  }
}
