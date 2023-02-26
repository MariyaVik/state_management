import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../getx/cart_controller.dart';
import 'order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Obx(() {
      final cartProvider = Get.find<CartController>();
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
    });
  }
}
