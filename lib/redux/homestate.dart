part of 'redux.dart';

class HomeState {
  int? indexBottomNavbar;
  RiveAnimationController? homeIconController;
  RiveAnimationController? profilIconController;
  RiveAnimationController? materiIconController;

  bool? isOffline;
  StreamSubscription? internetconnection;

  HomeState({
    this.indexBottomNavbar,
    this.homeIconController,
    this.profilIconController,
    this.materiIconController,
    this.isOffline,
  });

  HomeState.initialState() {
    indexBottomNavbar = 0;
    homeIconController = OneShotAnimation('Click', autoplay: true);
    profilIconController = OneShotAnimation('Click', autoplay: true);
    materiIconController = OneShotAnimation('Click', autoplay: true);
    isOffline = true;

    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        isOffline = true;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        isOffline = false;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        isOffline = false;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      }
    });
  }

  HomeState copyWith({
    int? indexBottomNavbar,
    RiveAnimationController? homeIconController,
    RiveAnimationController? profilIconController,
    RiveAnimationController? materiIconController,
    bool? isOffline,
  }) {
    return HomeState(
      indexBottomNavbar: indexBottomNavbar ?? this.indexBottomNavbar,
      homeIconController: homeIconController ?? this.homeIconController,
      profilIconController: profilIconController ?? this.profilIconController,
      materiIconController: materiIconController ?? this.materiIconController,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
