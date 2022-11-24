import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:flutter_mobx_sk/ui/cart/order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return StoreConnector<AppState, Map<Product, int>>(
    //     converter: (store) => store.state.cart,
    //     builder: ((context, cart) {
    //       return cart.isEmpty
    //           ? const Center(
    //               child: Text('Ваша корзина пуста'),
    //             )
    //           : Column(
    //               children: [
    //                 Expanded(
    //                   child: ListView.builder(
    //                     itemBuilder: (context, index) {
    //                       return OrderCardWidget(
    //                         product: cart.keys.toList()[index],
    //                       );
    //                     },
    //                     itemCount: cart.length,
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                     children: [
    //                       Column(
    //                         children: [
    //                           const Text('ИТОГО:'),
    //                           Text(
    //                               '${StoreProvider.of<AppState>(context).state.totalPrice}'),
    //                         ],
    //                       ),
    //                       ElevatedButton(
    //                           onPressed: () {}, child: const Text('Оплатить')),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             );
    //     }));
  }
}
