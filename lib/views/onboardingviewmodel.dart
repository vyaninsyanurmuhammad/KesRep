part of 'views.dart';

class OnBoardingViewModel {
  final int? initialScreen;

  OnBoardingViewModel({this.initialScreen});

  factory OnBoardingViewModel.create(Store<AppState> store) {
    return OnBoardingViewModel(
      initialScreen: store.state.onBoardingState?.initialScreen,
    );
  }
}
