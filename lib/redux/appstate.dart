part of 'redux.dart';

class AppState {
  HomeState? homeState;
  GameState? gameState;
  InGameState? ingameState;
  ResultState? resultState;
  PembahasanState? pembahasanState;
  AuthState? authState;
  OnBoardingState? onBoardingState;

  AppState({
    this.homeState,
    this.gameState,
    this.ingameState,
    this.resultState,
    this.pembahasanState,
    this.authState,
    this.onBoardingState,
  });

  AppState.initialState() {
    homeState = HomeState.initialState();
    gameState = GameState.initialState();
    ingameState = InGameState.initialState();
    resultState = ResultState.initialState();
    pembahasanState = PembahasanState.initialState();
    authState = AuthState.initialState();
    onBoardingState = OnBoardingState.initialState();
  }

  AppState copyWith({
    HomeState? homeState,
    GameState? gameState,
    InGameState? ingameState,
    ResultState? resultState,
    PembahasanState? pembahasanState,
    AuthState? authState,
    OnBoardingState? onBoardingState,
  }) {
    return AppState(
      homeState: homeState ?? this.homeState,
      gameState: gameState ?? this.gameState,
      ingameState: ingameState ?? this.ingameState,
      resultState: resultState ?? this.resultState,
      pembahasanState: pembahasanState ?? this.pembahasanState,
      authState: authState ?? this.authState,
      onBoardingState: onBoardingState ?? this.onBoardingState,
    );
  }
}
