import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/cart/cart_reducer.dart';
import 'package:flutter_redux_sk/redux/favorites/favorites_reducer.dart';
import 'package:flutter_redux_sk/redux/products/loading_reducer.dart';
import 'package:flutter_redux_sk/redux/products/products_reducer.dart';
import 'package:flutter_redux_sk/redux/tab/tab_reducer.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    isLoading: loadingReducer(state.isLoading, action),
    products: productsReducer(state.products, action),
    tab: tabReducer(state.tab, action),
    favorites: favoritesReducer(state.favorites, action),
    cart: cartReducer(state.cart, action));
