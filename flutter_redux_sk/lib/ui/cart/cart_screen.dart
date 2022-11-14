import 'package:flutter/material.dart';
import 'package:flutter_redux_sk/ui/cart/order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return BlocBuilder<CartBloc, CartState>(builder: ((context, state) {
    //   if (state is CartEmptyState) {
    //     return const Center(
    //       child: Text('Ваша корзина пуста'),
    //     );
    //   }
    //   return Column(
    //     children: [
    //       Expanded(
    //         child: ListView.builder(
    //           itemBuilder: (context, index) {
    //             return OrderCardWidget(
    //               product: state.cart.keys.toList()[index],
    //             );
    //           },
    //           itemCount: state.cart.length,
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Column(
    //               children: [
    //                 const Text('ИТОГО:'),
    //                 Text('${context.watch<CartBloc>().totalPrice}'),
    //                 // BlocBuilder<CartCubit, Map<Product, int>>(
    //                 //     builder: (context, state) {
    //                 //   // cart = ref.watch(cartProvider);
    //                 //   return Text('${state}');
    //                 // }),
    //               ],
    //             ),
    //             ElevatedButton(onPressed: () {}, child: const Text('Оплатить')),
    //           ],
    //         ),
    //       ),
    //     ],
    //   );
    // }));
  }
}
