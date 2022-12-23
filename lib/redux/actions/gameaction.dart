part of 'actions.dart';

class LoadGameAction {
  final Game? game;

  LoadGameAction({this.game});
}

class GetPlayerAction {}

class GetGameAction {}

class ClearGameAction {}

class LoadPlayerAction {
  Player? player;

  LoadPlayerAction({this.player});
}

class ClearPlayerAction {}
