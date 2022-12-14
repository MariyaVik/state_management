import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_sk/models/product.dart';
import 'package:hooks_riverpod_sk/ui/home_screen.dart';

class PlusMinusWidget extends HookConsumerWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              ref.read(cartProvider.notifier).reduce(product);
            }),
          ),
          Consumer(builder: (context, ref, _) {
            var productCount = ref.watch(cartProvider)[product].toString();
            return Text(productCount);
          }),
          IconButton(
            icon: const Text('+'),
            onPressed: (() {
              ref.read(cartProvider.notifier).add(product);
            }),
          ),
        ],
      ),
    );
  }
}
