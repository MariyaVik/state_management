import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/catalog_controller.dart';
import '../../models/product.dart';
import 'product_card_widget.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Obx(() {
      final productsProvider = Get.find<CatalogController>();
      return productsProvider.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : productsProvider.hasError.value
              ? Center(child: Text(productsProvider.error.value))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListProducts(
                    products: productsProvider.filteredProducts,
                  ));
    });
  }
}

class ListProducts extends StatelessWidget {
  final List<Product> products;
  const ListProducts({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductCardWidget(product: products[index * 2]),
            const SizedBox(width: 8),
            if (index * 2 + 1 < products.length)
              ProductCardWidget(product: products[index * 2 + 1]),
          ],
        ),
      ),
      itemCount: products.length ~/ 2 + 1 * products.length % 2,
    );
  }
}
