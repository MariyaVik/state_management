import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/models/filters.dart';
import 'package:flutter_mobx_sk/models/product.dart';
import 'package:flutter_mobx_sk/ui/catalog/product_card_widget.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  // @override
  // void didChangeDependencies() async {
  //   if (StoreProvider.of<AppState>(context).state.isLoading) {
  //     await StoreProvider.of<AppState>(context)
  //         .dispatch(ProductsLoadingAction());
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return StoreConnector<AppState, AppState>(
    //   converter: (store) => store.state,
    //   builder: (context, state) {
    //     return state.isLoading
    //         ? const Center(child: CircularProgressIndicator())
    //         : Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: ListProducts(
    //               products: state.products.where((p) {
    //                 var filter = state.filter;
    //                 switch (filter) {
    //                   case Filters.bacon:
    //                     return p.category == FilterName.baconFilter;
    //                   case Filters.pizza:
    //                     return p.category == FilterName.pizzaFilter;
    //                   case Filters.salad:
    //                     return p.category == FilterName.saladFilter;
    //                   default:
    //                     return true;
    //                 }
    //               }).toList(),
    //             ));
    //   },
    // );
  }
}

// products.where((p) {
//       var filter = store.state.filter;
//       switch (filter) {
//         case Filters.bacon:
//           return p.category == FilterName.baconFilter;
//         case Filters.pizza:
//           return p.category == FilterName.pizzaFilter;
//         case Filters.salad:
//           return p.category == FilterName.saladFilter;
//         default:
//           return true;
//       }
//     }).toList()

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
