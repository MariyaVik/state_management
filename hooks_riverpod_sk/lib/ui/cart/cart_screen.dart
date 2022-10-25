import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_sk/ui/cart/order_cart_widget.dart';
import 'package:hooks_riverpod_sk/ui/home_screen.dart';

class CartList extends HookConsumerWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.watch(cartProvider);
    return cart.isEmpty
        ? const Center(
            child: Text('Ваша корзина пуста'),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OrderCardWidget(
                      product: cart.keys.toList()[index],
                    );
                  },
                  itemCount: cart.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text('ИТОГО:'),
                        Consumer(builder: (context, ref, _) {
                          cart = ref.watch(cartProvider);
                          return Text(
                              '${ref.read(cartProvider.notifier).totalPrice}');
                        }),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Оплатить')),
                  ],
                ),
              ),
            ],
          );
  }
}
