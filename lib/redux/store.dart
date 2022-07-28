part of 'redux.dart';

Store<AppState> store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initialState(),
);
