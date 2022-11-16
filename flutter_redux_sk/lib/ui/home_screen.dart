import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/models/tab_item.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/tab/tab_actions.dart';
import 'package:flutter_redux_sk/ui/cart/cart_screen.dart';
import 'package:flutter_redux_sk/ui/catalog/catalog_screen.dart';
import 'package:flutter_redux_sk/ui/favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<TabItem> tabBar = [
    TabItem(title: "Каталог", icon: const Icon(Icons.list)),
    TabItem(title: "Избранное", icon: const Icon(Icons.favorite)),
    TabItem(title: "Корзина", icon: const Icon(Icons.shopping_basket)),
  ];

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogList(),
    const FavoriteList(),
    const CartList(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      converter: (store) => store.state.tab,
      builder: (context, tab) {
        int currentTabIndex = AppTab.values.indexOf(tab);
        return Scaffold(
          backgroundColor: Colors.white54,
          appBar: AppBar(
            title: Text(tabBar[currentTabIndex].title),
          ),
          body: Center(child: _widgetOptions[currentTabIndex]),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentTabIndex,
              onTap: ((index) => StoreProvider.of<AppState>(context)
                  .dispatch(UpdateTabAction(AppTab.values[index]))),
              items: [
                for (var item in tabBar)
                  BottomNavigationBarItem(
                    icon: item.icon,
                    label: item.title,
                  )
              ]),
        );
      },
    );
  }
}
