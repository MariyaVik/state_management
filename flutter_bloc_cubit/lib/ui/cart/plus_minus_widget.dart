import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc_cubit/models/product.dart';

class PlusMinusWidget extends StatelessWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            // iconSize: 28,
            // padding: EdgeInsets.all(0),
            icon: const Text('-'),
            onPressed: (() {
              context.read<CartCubit>().reduce(product);
            }),
          ),
          BlocBuilder<CartCubit, Map<Product, int>>(builder: (context, state) {
            return Text(state[product].toString());
          }),
          IconButton(
            // iconSize: 28,
            // padding: EdgeInsets.all(0),
            icon: const Text('+'),
            onPressed: (() {
              context.read<CartCubit>().add(product);
            }),
          ),
        ],
      ),
    );
  }
}
