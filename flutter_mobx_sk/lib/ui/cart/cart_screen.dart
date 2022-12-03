import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_sk/mobx/cart/cart_state.dart';
import 'package:flutter_mobx_sk/ui/cart/order_cart_widget.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Observer(builder: ((context) {
      final cartProvider = Provider.of<CartState>(context);
      return cartProvider.cart.isEmpty
          ? const Center(
              child: Text('Ваша корзина пуста'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderCardWidget(
                        product: cartProvider.cart.keys.toList()[index],
                      );
                    },
                    itemCount: cartProvider.cart.length,
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
                          Text('${cartProvider.totalPrice}'),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Оплатить')),
                    ],
                  ),
                ),
              ],
            );
    }));
  }
}
