import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sk/blocks/cart_bloc/cart_bloc.dart';
import 'package:flutter_bloc_sk/blocks/favorite_bloc/favorite_bloc.dart';
import 'package:flutter_bloc_sk/ui/home_screen.dart';
import 'package:flutter_bloc_sk/ui/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Vetka'),
        home: const HomeScreen(),
      ),
    );
  }
}
