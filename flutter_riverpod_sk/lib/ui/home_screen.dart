import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sk/models/cart_model.dart';
import 'package:flutter_riverpod_sk/models/favorite.dart';
import 'package:flutter_riverpod_sk/models/product.dart';
import 'package:flutter_riverpod_sk/models/tab_item.dart';
import 'package:flutter_riverpod_sk/services/api_service.dart';
import 'package:flutter_riverpod_sk/ui/cart/cart_screen.dart';
import 'package:flutter_riverpod_sk/ui/catalog/catalog_screen.dart';

import 'favorite_screen.dart';

APIService apiService = APIService(); // ИЗМЕНИИИИИИТЬ!!!

final favoriteProvider = StateNotifierProvider<FavoriteModel, List<Product>>(
    (ref) => FavoriteModel());

final cartProvider = ChangeNotifierProvider<CartModel>(((ref) => CartModel()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TabItem> tabBar = [
    TabItem(title: "Каталог", icon: const Icon(Icons.list)),
    TabItem(title: "Избранное", icon: const Icon(Icons.favorite)),
    TabItem(title: "Корзина", icon: const Icon(Icons.shopping_basket)),
  ];
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const CatalogList(),
    const FavoriteList(),
    const CartList(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text(tabBar[_selectedIndex].title),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            for (var item in tabBar)
              BottomNavigationBarItem(
                icon: item.icon,
                label: item.title,
              )
          ]),
    );
  }
}
