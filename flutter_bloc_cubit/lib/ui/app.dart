import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/cubit/cart/cart_cubit.dart';
import 'package:flutter_bloc_cubit/cubit/favorite/favorite_cubit.dart';
import 'package:flutter_bloc_cubit/ui/home_screen.dart';
import 'package:flutter_bloc_cubit/ui/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Vetka'),
        home: const HomeScreen(),
      ),
    );
  }
}
