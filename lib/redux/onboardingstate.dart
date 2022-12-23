part of 'redux.dart';

class OnBoardingState {
  int? initialScreen;
  bool? isLoading;

  OnBoardingState({
    this.initialScreen,
    this.isLoading,
  });

  OnBoardingState.initialState() {
    initialScreen;
    isLoading = true;
  }

  OnBoardingState copyWith({
    int? initialScreen,
    bool? isLoading,
  }) {
    return OnBoardingState(
      initialScreen: initialScreen ?? this.initialScreen,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
