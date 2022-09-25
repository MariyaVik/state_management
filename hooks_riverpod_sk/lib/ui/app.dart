import 'package:flutter/material.dart';
import 'package:hooks_riverpod_sk/ui/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'My'),
      home: HomeScreen(),
    );
  }
}
