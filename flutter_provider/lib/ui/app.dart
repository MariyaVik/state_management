import 'package:flutter/material.dart';
import 'package:flutter_provider/models/cart_model.dart';
import 'package:flutter_provider/models/favorite.dart';
import 'package:flutter_provider/ui/home_screen.dart';
import 'package:flutter_provider/ui/login_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteModel>(
          create: (context) => FavoriteModel(),
        ),
        ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'My'),
        home: HomeScreen(),
      ),
    );
  }
}
