part of 'reducers.dart';

final homeReducer = combineReducers<HomeState?>([
  TypedReducer<HomeState?, ChangeTapIndexAction>(_changeTapIndexAction),
  TypedReducer<HomeState?, ResetIndexBottomNavbarAction>(
      _resetIndexBottomNavbarAction),
  TypedReducer<HomeState?, IsHomeOfflineAction>(_isHomeOfflineAction),
]);

HomeState? _changeTapIndexAction(
    HomeState? state, ChangeTapIndexAction action) {
  return state?.copyWith(
    indexBottomNavbar: action.indexBottomNavbar,
    homeIconController: action.homeIconController,
    profilIconController: action.profilIconController,
    materiIconController: action.materiIconController,
  );
}

HomeState? _resetIndexBottomNavbarAction(
    HomeState? state, ResetIndexBottomNavbarAction action) {
  return state?.copyWith(indexBottomNavbar: 0);
}

HomeState? _isHomeOfflineAction(HomeState? state, IsHomeOfflineAction action) {
  return state?.copyWith(isOffline: action.isOffline);
}
