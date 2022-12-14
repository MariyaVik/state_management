import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/mobx/cart/cart_state.dart';
import 'package:flutter_mobx_sk/mobx/favorites/favorites.dart';
import 'package:flutter_mobx_sk/mobx/products/products.dart';
import 'package:flutter_mobx_sk/services/api_service.dart';
import 'package:flutter_mobx_sk/ui/home_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ProductsState(APIService())),
        Provider(create: (context) => FavoritesState()),
        Provider(create: (context) => CartState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Vetka'),
        home: const HomeScreen(),
      ),
    );
  }
}
