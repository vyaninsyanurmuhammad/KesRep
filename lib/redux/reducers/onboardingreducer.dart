part of 'reducers.dart';

final onBoardingReducer = combineReducers<OnBoardingState?>([
  TypedReducer<OnBoardingState?, LoadInitialScreenAction>(
      _loadInitialScreenAction),
]);

OnBoardingState? _loadInitialScreenAction(
    OnBoardingState? state, LoadInitialScreenAction action) {
  return state?.copyWith(initialScreen: action.initialScreen);
}
