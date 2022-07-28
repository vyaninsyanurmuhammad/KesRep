part of 'actions.dart';

class LoadGameAction {
  final Game? game;

  LoadGameAction({this.game});
}

class LoadPlayerAction {
  Player? player;

  LoadPlayerAction({this.player});
}

class ClearPlayerAction {}
