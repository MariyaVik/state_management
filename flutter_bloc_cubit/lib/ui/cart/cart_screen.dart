import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc_cubit/models/product.dart';
import 'package:flutter_bloc_cubit/ui/cart/order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, Map<Product, int>>(
        builder: ((context, state) {
      return state.isEmpty
          ? const Center(
              child: Text('Ваша корзина пуста'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderCardWidget(
                        product: state.keys.toList()[index],
                      );
                    },
                    itemCount: state.length,
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
                          Text('${context.watch<CartCubit>().totalPrice}'),
                          // BlocBuilder<CartCubit, Map<Product, int>>(
                          //     builder: (context, state) {
                          //   // cart = ref.watch(cartProvider);
                          //   return Text('${state}');
                          // }),
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
