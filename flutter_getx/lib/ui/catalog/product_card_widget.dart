import 'package:flutter/material.dart';
import 'package:flutter_getx/getx/cart_controller.dart';
import 'package:flutter_getx/getx/favorites_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../cart/plus_minus_widget.dart';

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
    // return ElevatedButton(onPressed: () {}, child: const Text('В корзину'));
    return Obx(
      () {
        final cartProvider = Get.find<CartController>();
        bool isInCart = cartProvider.cart.containsKey(product);
        return isInCart
            ? PlusMinusWidget(product: product)
            : ElevatedButton(
                onPressed: () => cartProvider.addProduct(product),
                child: const Text('В корзину'));
      },
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final Product product;
  const FavoriteButton({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return IconButton(onPressed: () {}, icon: Icon(Icons.favorite));
    return Obx(() {
      final favoritesProvider = Get.find<FavoritesController>();
      bool isInFavorite = favoritesProvider.favorites.contains(product);
      return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon:
            Icon(isInFavorite ? Icons.favorite_rounded : Icons.favorite_border),
        onPressed: isInFavorite
            ? () => favoritesProvider.removeProduct(product)
            : () => favoritesProvider.addProduct(product),
      );
    });
  }
}
