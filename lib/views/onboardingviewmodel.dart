part of 'views.dart';

class OnBoardingViewModel {
  final int? initialScreen;
  final Function? setInitialScreen;
  final bool? isLoading;

  OnBoardingViewModel(
      {this.initialScreen, this.isLoading, this.setInitialScreen});

  factory OnBoardingViewModel.create(Store<AppState> store) {
    _setInitialScreen() {
      InitialScreenHelper.setInitialScreen();
    }

    return OnBoardingViewModel(
      initialScreen: store.state.onBoardingState?.initialScreen,
      isLoading: store.state.onBoardingState?.isLoading,
      setInitialScreen: _setInitialScreen,
    );
  }
}
