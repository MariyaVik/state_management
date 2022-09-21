import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sk/ui/cart/order_cart_widget.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return OrderCardWidget(
                index: index,
              );
            },
            itemCount: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [Text('ИТОГО:'), Text('555')],
              ),
              ElevatedButton(onPressed: () {}, child: Text('Оплатить')),
            ],
          ),
        ),
      ],
    );
  }
}
