import 'package:flutter_redux_sk/models/app_tab.dart';
import 'package:flutter_redux_sk/redux/tab/tab_actions.dart';
import 'package:redux/redux.dart';

final tabReducer = combineReducers<AppTab>([
  TypedReducer<AppTab, UpdateTabAction>(_activeTabReducer),
]);

AppTab _activeTabReducer(AppTab activeTab, UpdateTabAction action) {
  if (activeTab == action.newTab) return activeTab;
  return action.newTab;
}
