import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/cart/cart_reducer.dart';
import 'package:flutter_redux_sk/redux/favorites/favorites_reducer.dart';
import 'package:flutter_redux_sk/redux/filter/filter_reducer.dart';
import 'package:flutter_redux_sk/redux/products/filtered_products_reducer.dart';
import 'package:flutter_redux_sk/redux/products/loading_reducer.dart';
import 'package:flutter_redux_sk/redux/products/products_reducer.dart';
import 'package:flutter_redux_sk/redux/tab/tab_reducer.dart';
import 'package:flutter_redux_sk/redux/total_price/price_reducer.dart';

AppState reducer(AppState state, dynamic action) => AppState(
    isLoading: loadingReducer(state.isLoading, action),
    products: productsReducer(state.products, action),
    tab: tabReducer(state.tab, action),
    favorites: favoritesReducer(state.favorites, action),
    cart: cartReducer(state.cart, action),
    totalPrice: priceReducer(state.totalPrice, action),
    filter: filterReducer(state.filter, action),
    filteredProducts: filteredProductsReducer(state.products, action));
