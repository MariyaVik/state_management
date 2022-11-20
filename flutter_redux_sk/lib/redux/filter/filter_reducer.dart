import 'package:flutter_redux_sk/models/filters.dart';
import 'package:flutter_redux_sk/redux/filter/filter_actions.dart';
import 'package:redux/redux.dart';

final filterReducer = combineReducers<Filters>([
  TypedReducer<Filters, FilterUpdateAction>(_changeFilter),
]);

Filters _changeFilter(Filters currentFilter, FilterUpdateAction action) {
  if (currentFilter == action.newFilter) return currentFilter;
  return action.newFilter;
}
