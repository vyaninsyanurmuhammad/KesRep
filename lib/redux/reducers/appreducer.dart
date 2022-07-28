part of 'reducers.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    homeState: homeReducer(state.homeState, action),
    gameState: gameReducer(state.gameState, action),
    ingameState: ingameReducer(state.ingameState, action),
    resultState: resultReducer(state.resultState, action),
    pembahasanState: pembahasanReducer(state.pembahasanState, action),
    authState: authReducer(state.authState, action),
    onBoardingState: onBoardingReducer(state.onBoardingState, action),
  );
}
