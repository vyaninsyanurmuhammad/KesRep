part of 'reducers.dart';

final gameReducer = combineReducers<GameState?>([
  TypedReducer<GameState?, LoadGameAction>(_loadGameAction),
  TypedReducer<GameState?, LoadPlayerAction>(_loadPlayerAction),
  TypedReducer<GameState?, ClearPlayerAction>(_clearPlayerAction),
  TypedReducer<GameState?, ClearGameAction>(_clearGameAction),
]);

GameState? _loadGameAction(GameState? state, LoadGameAction action) {
  return state?.copyWith(game: action.game);
}

GameState? _loadPlayerAction(GameState? state, LoadPlayerAction action) {
  return state?.copyWith(player: action.player);
}

GameState? _clearPlayerAction(GameState? state, ClearPlayerAction action) {
  return state?.copyWith(
    player: Player.fromJson({
      "uid": "",
      "name": "",
      "email": "",
      "unitAchived": [
        {"id": "1", "level": "1", "stageAchieved": []}
      ]
    }),
  );
}

GameState? _clearGameAction(GameState? state, ClearGameAction action) {
  return state?.copyWith(
    game: Game.fromJson({
      "unit": [
        {"id": "1", "level": "1", "stage": []},
      ]
    }),
  );
}
