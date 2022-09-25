import 'package:flutter/material.dart';
import 'package:flutter_bloc_sk/ui/cart/order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = [];
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
                      index: index,
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
                      children: [const Text('ИТОГО:'), Text('555')],
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
