import 'package:flutter_redux_sk/redux/total_price/price_actions.dart';
import 'package:redux/redux.dart';

final priceReducer = combineReducers<double>(
    [TypedReducer<double, PriceLoadAction>(_calcTotalPrice)]);

double _calcTotalPrice(double price, PriceLoadAction action) {
  return action.cart.keys.fold(
      0, (total, current) => total + current.price * action.cart[current]!);
}
