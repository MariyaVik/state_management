import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../getx/cart_controller.dart';
import '../../models/product.dart';

class PlusMinusWidget extends StatelessWidget {
  final Product product;
  const PlusMinusWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Get.find<CartController>();
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
          Obx(() {
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
