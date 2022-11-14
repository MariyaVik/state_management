import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/products/products_actions.dart';
import 'package:flutter_redux_sk/ui/catalog/product_card_widget.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  void didChangeDependencies() async {
    if (StoreProvider.of<AppState>(context).state.isLoading) {
      await StoreProvider.of<AppState>(context)
          .dispatch(ProductsLoadingAction());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductCardWidget(product: state.products[index * 2]),
                        const SizedBox(width: 8),
                        if (index * 2 + 1 < state.products.length)
                          ProductCardWidget(
                              product: state.products[index * 2 + 1]),
                      ],
                    ),
                  ),
                  itemCount: state.products.length ~/ 2 +
                      1 * state.products.length % 2,
                ),
              );
      },
    );
  }
}
