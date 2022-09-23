import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sk/ui/cart/order_cart_widget.dart';
import 'package:flutter_riverpod_sk/ui/home_screen.dart';

class CartList extends ConsumerWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.watch(cartProvider);
    return cart.products.isEmpty
        ? const Center(
            child: Text('Ваша корзина пуста'),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OrderCardWidget(
                      product: cart.products.keys.toList()[index],
                    );
                  },
                  itemCount: cart.products.length,
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
                        Text(cart.totalPrice.toString()),
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
