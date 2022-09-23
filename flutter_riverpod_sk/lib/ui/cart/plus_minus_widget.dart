import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sk/models/cart_model.dart';
import 'package:flutter_riverpod_sk/models/product.dart';
import 'package:flutter_riverpod_sk/ui/home_screen.dart';

class PlusMinusWidget extends ConsumerWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.read(cartProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Text('-'),
            onPressed: (() {
              cart.reduce(product);
            }),
          ),
          Consumer(builder: (context, ref, _) {
            var productCount =
                ref.watch(cartProvider).products[product].toString();
            return Text(productCount);
          }),
          IconButton(
            icon: const Text('+'),
            onPressed: (() {
              cart.add(product);
            }),
          ),
        ],
      ),
    );
  }
}
