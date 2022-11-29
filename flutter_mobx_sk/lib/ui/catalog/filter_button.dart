import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/mobx/products/products.dart';
import 'package:flutter_mobx_sk/models/filters.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsState>(context);
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filters>>[
        PopupMenuItem(
          value: Filters.all,
          child: Text(FilterName.allFilter),
          onTap: () {
            productsProvider.currentFilter = Filters.all;
          },
        ),
        PopupMenuItem(
          value: Filters.pizza,
          child: Text(FilterName.pizzaFilter),
          onTap: () {
            productsProvider.currentFilter = Filters.pizza;
          },
        ),
        PopupMenuItem(
          value: Filters.bacon,
          child: Text(FilterName.baconFilter),
          onTap: () {
            productsProvider.currentFilter = Filters.bacon;
          },
        ),
        PopupMenuItem(
          value: Filters.salad,
          child: Text(FilterName.saladFilter),
          onTap: () {
            productsProvider.currentFilter = Filters.salad;
          },
        ),
      ],
    );
  }
}
