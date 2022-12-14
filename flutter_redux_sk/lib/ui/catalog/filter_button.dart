import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sk/models/filters.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/filter/filter_actions.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.filter_alt),
      itemBuilder: (BuildContext context) => <PopupMenuItem<Filters>>[
        PopupMenuItem(
          value: Filters.all,
          child: Text(FilterName.allFilter),
          onTap: () => StoreProvider.of<AppState>(context)
              .dispatch(FilterUpdateAction(newFilter: Filters.all)),
        ),
        PopupMenuItem(
          value: Filters.pizza,
          child: Text(FilterName.pizzaFilter),
          onTap: () => StoreProvider.of<AppState>(context)
              .dispatch(FilterUpdateAction(newFilter: Filters.pizza)),
        ),
        PopupMenuItem(
          value: Filters.bacon,
          child: Text(FilterName.baconFilter),
          onTap: () => StoreProvider.of<AppState>(context)
              .dispatch(FilterUpdateAction(newFilter: Filters.bacon)),
        ),
        PopupMenuItem(
          value: Filters.salad,
          child: Text(FilterName.saladFilter),
          onTap: () => StoreProvider.of<AppState>(context)
              .dispatch(FilterUpdateAction(newFilter: Filters.salad)),
        ),
      ],
    );
  }
}
