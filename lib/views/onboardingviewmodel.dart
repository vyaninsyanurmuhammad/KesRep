part of 'views.dart';

class OnBoardingViewModel {
  final int? initialScreen;
  final bool? isLoading;

  OnBoardingViewModel({this.initialScreen, this.isLoading});

  factory OnBoardingViewModel.create(Store<AppState> store) {
    return OnBoardingViewModel(
      initialScreen: store.state.onBoardingState?.initialScreen,
      isLoading: store.state.onBoardingState?.isLoading,
    );
  }
}
