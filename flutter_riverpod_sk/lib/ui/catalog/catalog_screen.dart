import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sk/ui/catalog/product_card_widget.dart';
import 'package:flutter_riverpod_sk/ui/home_screen.dart';
import 'package:flutter_riverpod_sk/ui/no_internet_widget.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Center(
              child: Text('NONE'),
            );
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            return apiService.hasError
                ? const Center(
                    child: NoInternetWidget(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            ProductCardWidget(
                                product: apiService.products[index * 2]),
                            const SizedBox(width: 8),
                            if (index * 2 + 1 < apiService.products.length)
                              ProductCardWidget(
                                  product: apiService.products[index * 2 + 1]),
                          ],
                        ),
                      ),
                      itemCount: apiService.products.length % 2 == 0
                          ? apiService.products.length ~/ 2
                          : (apiService.products.length ~/ 2) + 1,
                    ),
                  );
          default:
            return const Center(
              child: Text('Default'),
            );
        }
      },
    );
  }
}
