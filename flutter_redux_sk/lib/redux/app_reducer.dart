import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/products/loading_reducer.dart';
import 'package:flutter_redux_sk/redux/products/products_reducer.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    isLoading: loadingReducer(state.isLoading, action),
    products: productsReducer(state.products, action));
