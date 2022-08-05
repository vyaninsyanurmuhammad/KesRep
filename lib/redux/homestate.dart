part of 'redux.dart';

class HomeState {
  int? indexBottomNavbar;
  RiveAnimationController? homeIconController;
  RiveAnimationController? profilIconController;
  RiveAnimationController? materiIconController;

  HomeState({
    this.indexBottomNavbar,
    this.homeIconController,
    this.profilIconController,
    this.materiIconController,
  });

  HomeState.initialState() {
    indexBottomNavbar = 0;
    homeIconController = OneShotAnimation('Click', autoplay: true);
    profilIconController = OneShotAnimation('Click', autoplay: true);
    materiIconController = OneShotAnimation('Click', autoplay: true);
  }

  HomeState copyWith({
    int? indexBottomNavbar,
    RiveAnimationController? homeIconController,
    RiveAnimationController? profilIconController,
    RiveAnimationController? materiIconController,
  }) {
    return HomeState(
      indexBottomNavbar: indexBottomNavbar ?? this.indexBottomNavbar,
      homeIconController: homeIconController ?? this.homeIconController,
      profilIconController: profilIconController ?? this.profilIconController,
      materiIconController: materiIconController ?? this.materiIconController,
    );
  }
}
