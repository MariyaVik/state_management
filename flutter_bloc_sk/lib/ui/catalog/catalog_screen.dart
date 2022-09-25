import 'package:flutter/material.dart';
import 'package:flutter_bloc_sk/ui/catalog/product_card_widget.dart';
import 'package:flutter_bloc_sk/ui/home_screen.dart';
import 'package:flutter_bloc_sk/ui/no_internet_widget.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Center(
              child: Text('NONE'),
            );
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            return apiService.hasError
                ? Center(
                    child: NoInternetWidget(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                            child: ProductCardWidget(
                                product: apiService.products[index * 2])),
                        if (apiService.products.length >= index * 2 + 1)
                          Expanded(
                              child: ProductCardWidget(
                                  product: apiService.products[index * 2 + 1])),
                      ],
                    ),
                    itemCount: apiService.products.length ~/ 2 +
                        1 * apiService.products.length % 2,
                  );
          default:
            return SingleChildScrollView(
              child: Text('Default'),
            );
        }
      },
    );
  }
}
