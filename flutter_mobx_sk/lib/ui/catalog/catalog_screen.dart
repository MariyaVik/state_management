import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_sk/mobx/products/products.dart';
import 'package:flutter_mobx_sk/models/filters.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:flutter_mobx_sk/services/api_service.dart';
import 'package:flutter_mobx_sk/ui/catalog/product_card_widget.dart';
import 'package:provider/provider.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsState>(context);
    // return Container();
    return Observer(
      builder: (context) {
        return productsProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : productsProvider.hasError
                ? Center(child: Text(productsProvider.error))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListProducts(
                      products: productsProvider.filteredProducts,
                    ));
      },
    );
  }
}

class ListProducts extends StatelessWidget {
  final List<Product> products;
  ListProducts({required this.products, super.key});

  final api = APIService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => index == 0
          ? ElevatedButton(
              onPressed: (() => api.addProduct()),
              child: const Text('Добавить'),
            )
          : Padding(
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
