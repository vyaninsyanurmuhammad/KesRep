part of 'views.dart';

class GameViewModel {
  final Game? game;
  final Player? player;

  bool Function(String)? isLockedStage;
  StageAchieved Function(String)? whichStageAchived;

  GameViewModel({
    this.game,
    this.player,
    this.isLockedStage,
    this.whichStageAchived,
  });

  factory GameViewModel.create(Store<AppState> store) {
    _isLockedStage(String id) {
      bool _isLocked = true;

      List<Stage> _stage = [];

      List<StageAchieved> _liststageAcived = [];
      List<StageAchieved> _trueliststageAcived = [];
      StageAchieved _laststageAcived = StageAchieved();

      List<Unit>? _unit = store.state.gameState?.game?.unit;

      List<UnitAchived>? _unitAchieved =
          store.state.gameState?.player?.unitAchived;

      for (var i = 0; i < _unit!.length; i++) {
        _stage.addAll(_unit[i].stage!.where((element) => element.id == id));
      }

      for (var i = 0; i < _unitAchieved!.length; i++) {
        _liststageAcived.addAll(_unitAchieved[i]
            .stageAchieved!
            .where((element) => element.id == id));
      }

      for (var i = 0; i < _unitAchieved.length; i++) {
        if (_unitAchieved[i].stageAchieved!.isNotEmpty) {
          _laststageAcived = (_unitAchieved[i].stageAchieved!.last);
        }
        _trueliststageAcived.addAll(_unitAchieved[i].stageAchieved!);
      }

      // unlock stage jika score terbaik >= 70 % dan jumlah medal yang dibutuhkan cukup
      for (var i = 0; i < _stage.length; i++) {
        if (_laststageAcived.scores?.last != null) {
          if (_trueliststageAcived.length == _stage[i].medalRequred! &&
              _laststageAcived.scores!.last >= 70) {
            _isLocked = false;
          }
        } else {
          if (_trueliststageAcived.length == _stage[i].medalRequred!) {
            _isLocked = false;
          }
        }
      }

      // unlock stage jika game sudah pernah dimainkan
      for (var i = 0; i < _liststageAcived.length; i++) {
        if (_liststageAcived[i].isPlayed! == true) {
          _isLocked = false;
        }
      }

      return _isLocked;
    }

    _whichStageAchived(String id) {
      StageAchieved _stageAchieved = StageAchieved();
      List<StageAchieved> _liststageAcived = [];

      List<UnitAchived>? _unitAchieved =
          store.state.gameState?.player?.unitAchived;

      for (var i = 0; i < _unitAchieved!.length; i++) {
        _liststageAcived.addAll(_unitAchieved[i]
            .stageAchieved!
            .where((element) => element.id == id));
      }

      for (var i = 0; i < _liststageAcived.length; i++) {
        _stageAchieved = _liststageAcived[i];
      }

      return _stageAchieved;
    }

    return GameViewModel(
      game: store.state.gameState?.game,
      player: store.state.gameState?.player,
      isLockedStage: _isLockedStage,
      whichStageAchived: _whichStageAchived,
    );
  }
}
