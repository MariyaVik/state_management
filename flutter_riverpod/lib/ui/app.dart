import 'package:flutter/material.dart';
import 'package:flutter_provider/ui/home_screen.dart';
import 'package:flutter_provider/ui/login_screen.dart';

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
