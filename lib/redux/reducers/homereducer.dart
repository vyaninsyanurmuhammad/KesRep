part of 'reducers.dart';

final homeReducer = combineReducers<HomeState?>([
  TypedReducer<HomeState?, ChangeTapIndexAction>(_changeTapIndexAction),
  TypedReducer<HomeState?, ResetIndexBottomNavbarAction>(
      _resetIndexBottomNavbarAction),
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
