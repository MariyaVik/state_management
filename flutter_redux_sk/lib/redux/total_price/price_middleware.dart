import 'package:flutter_redux_sk/redux/app_state.dart';
import 'package:flutter_redux_sk/redux/total_price/price_actions.dart';
import 'package:redux/redux.dart';

Middleware<AppState> changeTotalPrice() {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    store.dispatch(PriceLoadAction(cart: store.state.cart));
  };
}
