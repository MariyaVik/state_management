import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../getx/catalog_controller.dart';
import '../../models/filters.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Get.find<CatalogController>();
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filters>>[
        PopupMenuItem(
          value: Filters.all,
          child: Text(FilterName.allFilter),
          onTap: () {
            if (productsProvider.currentFilter.value != Filters.all) {
              productsProvider.currentFilter.value = Filters.all;
            }
          },
        ),
        PopupMenuItem(
          value: Filters.pizza,
          child: Text(FilterName.pizzaFilter),
          onTap: () {
            if (productsProvider.currentFilter.value != Filters.pizza) {
              productsProvider.currentFilter.value = Filters.pizza;
            }
          },
        ),
        PopupMenuItem(
          value: Filters.bacon,
          child: Text(FilterName.baconFilter),
          onTap: () {
            if (productsProvider.currentFilter.value != Filters.bacon) {
              productsProvider.currentFilter.value = Filters.bacon;
            }
          },
        ),
        PopupMenuItem(
          value: Filters.salad,
          child: Text(FilterName.saladFilter),
          onTap: () {
            if (productsProvider.currentFilter.value != Filters.salad) {
              productsProvider.currentFilter.value = Filters.salad;
            }
          },
        ),
      ],
    );
  }
}
