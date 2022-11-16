import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/redux/app_middleware.dart';
import 'package:flutter_redux_sk/redux/app_reducer.dart';
import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/ui/home_screen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final store = Store<AppState>(reducer,
      middleware: appMiddleware(),
      initialState:
          const AppState(products: [], isLoading: true, tab: AppTab.catalog));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Vetka'),
        home: HomeScreen(),
      ),
    );
  }
}
