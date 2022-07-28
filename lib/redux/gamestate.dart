part of 'redux.dart';

class GameState {
  Game? game;
  Player? player;

  GameState({
    this.game,
    this.player,
  });

  GameState.initialState() {
    game = GameHelper.game;
    player = PlayerHelper.player;
  }

  GameState copyWith({
    Game? game,
    Player? player,
  }) {
    return GameState(
      game: game ?? this.game,
      player: player ?? this.player,
    );
  }
}
