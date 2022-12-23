part of 'middlewares.dart';

void homeMiddleware(Store<AppState> store, action, NextDispatcher next) async {
  next(action);

  if (action is GetPlayerAction) {
    store.dispatch(LoadPlayerAction(player: await PlayerHelper.fetchPlayer()));
  }
  if (action is GetGameAction) {
    store.dispatch(LoadGameAction(game: await GameHelper.loadGame()));
  }
}
