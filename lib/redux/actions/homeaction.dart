part of 'actions.dart';

class ChangeTapIndexAction {
  final int? indexBottomNavbar;
  final RiveAnimationController? homeIconController;
  final RiveAnimationController? profilIconController;
  final RiveAnimationController? materiIconController;

  ChangeTapIndexAction({
    this.indexBottomNavbar,
    this.homeIconController,
    this.profilIconController,
    this.materiIconController,
  });
}

class ResetIndexBottomNavbarAction {}

class IsHomeOfflineAction {
  final bool? isOffline;

  IsHomeOfflineAction({this.isOffline});
}
