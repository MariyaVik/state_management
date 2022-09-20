import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart_model.dart';
import 'package:flutter_provider/models/product.dart';
import 'package:provider/provider.dart';

class PlusMinusWidget extends StatelessWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();
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
              cart.reduce(product);
            }),
          ),
          Text(cart.products[product].toString()),
          IconButton(
            icon: const Text('+'),
            onPressed: (() {
              cart.add(product);
            }),
          ),
        ],
      ),
    );
  }
}
