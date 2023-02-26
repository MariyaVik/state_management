import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../getx/init_controllers.dart';
import 'home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Vetka'),
      home: const HomeScreen(),
    );
  }
}
