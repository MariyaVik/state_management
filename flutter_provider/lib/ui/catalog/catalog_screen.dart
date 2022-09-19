import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/catalog/product_card_widget.dart';
import 'package:flutter_provider/ui/home_screen.dart';
import 'package:flutter_provider/ui/no_internet_widget.dart';

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
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) => ProductCardWidget(
                          product: apiService.products[index]),
                      itemCount: apiService.products.length,
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
