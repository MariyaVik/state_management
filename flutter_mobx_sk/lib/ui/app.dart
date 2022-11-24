import 'package:flutter/material.dart';
import 'package:flutter_mobx_sk/ui/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Vetka'),
      home: HomeScreen(),
    );
  }
}
