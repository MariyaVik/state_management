import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc_cubit/models/product.dart';
import 'package:flutter_bloc_cubit/ui/cart/plus_minus_widget.dart';

class OrderCardWidget extends StatelessWidget {
  final Product product;
  const OrderCardWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromARGB(
      //     255, 255 - index * 10, 255 - index * 5, 255 - index * 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox.square(
                dimension: 100,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const ColoredBox(color: Colors.cyan),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<CartCubit>().remove(product);
                          },
                          icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  Text(product.category),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.price.toString()),
                      PlusMinusWidget(
                        product: product,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
