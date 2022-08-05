part of 'views.dart';

class ResultViewModel {
  final double? result;

  final List<Quiz>? quizzes;
  final List<Quiz>? quizzesAnswered;

  final UnitAchived? unitAchived;
  final StageAchieved? stageAchieved;
  final Unit? positionUnit;
  final Stage? positionStage;

  void Function()? addResultToFirebase;

  final bool? isLoading;

  ResultViewModel({
    this.quizzes,
    this.quizzesAnswered,
    this.result,
    this.unitAchived,
    this.stageAchieved,
    this.positionUnit,
    this.positionStage,
    this.addResultToFirebase,
    this.isLoading,
  });

  factory ResultViewModel.create(Store<AppState> store) {
    _addResultToFirebase() {
      StageAchieved newStageAchieved =
          (store.state.resultState!.stageAchieved!.firstScore == null)
              ? StageAchieved(
                  id: store.state.resultState!.positionStage!.id,
                  level: store.state.resultState!.positionStage!.level,
                  isPlayed: true,
                  medalAchieved: ScoreHelper.scoreDecider(
                    score: store.state.resultState!.result!.toInt(),
                  ),
                  score: store.state.resultState!.result!.toInt(),
                  firstScore: store.state.resultState!.result!.toInt(),
                )
              : StageAchieved(
                  id: store.state.resultState!.positionStage!.id,
                  level: store.state.resultState!.positionStage!.level,
                  isPlayed: true,
                  medalAchieved: ScoreHelper.scoreDecider(
                    score: store.state.resultState!.result!.toInt(),
                  ),
                  score: store.state.resultState!.result!.toInt(),
                  firstScore: store
                      .state.resultState!.stageAchieved!.firstScore!
                      .toInt(),
                );

      double _oldScore = 0.0;

      if (store.state.resultState!.stageAchieved!.score == null) {
        _oldScore = 0.0;
      } else {
        _oldScore = store.state.resultState!.stageAchieved!.score!.toDouble();
      }

      if (!(store.state.resultState!.result! <= _oldScore)) {
        PlayerHelper.addResult(
          unitAchived: [store.state.resultState!.unitAchived!],
          stageAchieved: newStageAchieved,
          positionStage: store.state.resultState!.positionStage,
          positionUnit: store.state.resultState!.positionUnit,
        );
      }
    }

    return ResultViewModel(
      result: store.state.resultState?.result,
      quizzes: store.state.resultState?.quizzes,
      quizzesAnswered: store.state.resultState?.quizzesAnswered,
      unitAchived: store.state.resultState?.unitAchived,
      stageAchieved: store.state.resultState?.stageAchieved,
      positionUnit: store.state.resultState?.positionUnit,
      positionStage: store.state.resultState?.positionStage,
      addResultToFirebase: _addResultToFirebase,
      isLoading: store.state.resultState?.isLoading,
    );
  }
}
