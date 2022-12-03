import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_sk/mobx/cart/cart_state.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:provider/provider.dart';

class PlusMinusWidget extends StatelessWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartState>(context);
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
            onPressed: () => cartProvider.reduceProduct(product),
          ),
          Observer(builder: (context) {
            return Text('${cartProvider.cart[product]}');
          }),
          IconButton(
            // iconSize: 28,
            // padding: EdgeInsets.all(0),
            icon: const Text('+'),
            onPressed: () => cartProvider.addProduct(product),
          ),
        ],
      ),
    );
  }
}
