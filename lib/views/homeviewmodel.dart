part of 'views.dart';

class HomeViewModel {
  final int? indexBottomNavbar;
  final Function(int)? onChangeTapIndex;
  final bool Function()? homeIconPlay;
  final RiveAnimationController? homeIconController;
  final RiveAnimationController? profilIconController;
  final RiveAnimationController? materiIconController;

  HomeViewModel({
    this.indexBottomNavbar,
    this.onChangeTapIndex,
    this.homeIconPlay,
    this.homeIconController,
    this.profilIconController,
    this.materiIconController,
  });

  factory HomeViewModel.create(Store<AppState> store) {
    RiveAnimationController? _homeIconController =
        store.state.homeState?.homeIconController;
    RiveAnimationController? _profilIconController =
        store.state.homeState?.profilIconController;
    RiveAnimationController? _materiIconController =
        store.state.homeState?.materiIconController;

    _playTrackChange(RiveAnimationController controller) {
      if (controller.isActive == false) {
        controller.isActive = true;
      }
      return controller;
    }

    _onChangeTapIndex(int index) {
      ClickHelper.clickSound();

      store.dispatch(ChangeTapIndexAction(
        indexBottomNavbar: index,
        homeIconController:
            (index == 0) ? _playTrackChange(_homeIconController!) : null,
        profilIconController:
            (index == 1) ? _playTrackChange(_profilIconController!) : null,
        materiIconController:
            (index == 2) ? _playTrackChange(_materiIconController!) : null,
      ));
    }

    return HomeViewModel(
      indexBottomNavbar: store.state.homeState?.indexBottomNavbar,
      onChangeTapIndex: _onChangeTapIndex,
      homeIconController: store.state.homeState?.homeIconController,
      profilIconController: store.state.homeState?.profilIconController,
      materiIconController: store.state.homeState?.materiIconController,
    );
  }
}
