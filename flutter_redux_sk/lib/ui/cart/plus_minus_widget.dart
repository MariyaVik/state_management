import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sk/models/product.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/cart/cart_actions.dart';

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
            onPressed: () => StoreProvider.of<AppState>(context)
                .dispatch(ReduceFromCartAction(product: product)),
          ),
          StoreConnector<AppState, Map<Product, int>>(
              converter: (store) => store.state.cart,
              builder: (context, cart) {
                return Text(cart[product].toString());
              }),
          IconButton(
            // iconSize: 28,
            // padding: EdgeInsets.all(0),
            icon: const Text('+'),
            onPressed: () => StoreProvider.of<AppState>(context)
                .dispatch(AddToCartAction(product: product)),
          ),
        ],
      ),
    );
  }
}
