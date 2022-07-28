part of 'redux.dart';

class OnBoardingState {
  int? initialScreen;

  OnBoardingState({
    this.initialScreen,
  });

  OnBoardingState.initialState() {
    initialScreen;
  }

  OnBoardingState copyWith({
    int? initialScreen,
  }) {
    return OnBoardingState(
      initialScreen: initialScreen ?? this.initialScreen,
    );
  }
}
