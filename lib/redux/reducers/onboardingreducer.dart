part of 'reducers.dart';

final onBoardingReducer = combineReducers<OnBoardingState?>([
  TypedReducer<OnBoardingState?, LoadInitialScreenAction>(
      _loadInitialScreenAction),
  TypedReducer<OnBoardingState?, IsLoadingOnBoardingAction>(
      _isLoadingOnBoardingAction),
]);

OnBoardingState? _loadInitialScreenAction(
    OnBoardingState? state, LoadInitialScreenAction action) {
  return state?.copyWith(initialScreen: action.initialScreen);
}

OnBoardingState? _isLoadingOnBoardingAction(
    OnBoardingState? state, IsLoadingOnBoardingAction action) {
  return state?.copyWith(isLoading: action.isLoading);
}
