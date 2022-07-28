part of 'redux.dart';

class ResultState {
  double? result;

  List<Quiz>? quizzes;
  List<Quiz>? quizzesAnswered;

  UnitAchived? unitAchived;
  StageAchieved? stageAchieved;
  Unit? positionUnit;
  Stage? positionStage;
  bool? isLoading;

  ResultState({
    this.result,
    this.quizzes,
    this.quizzesAnswered,
    this.unitAchived,
    this.stageAchieved,
    this.positionUnit,
    this.positionStage,
    this.isLoading,
  });

  ResultState.initialState() {
    result = 0.0;
    quizzes = [];
    quizzesAnswered = [];

    unitAchived = UnitAchived();
    stageAchieved = StageAchieved();
    positionUnit = Unit();
    positionStage = Stage();

    isLoading = false;
  }

  ResultState copyWith({
    double? result,
    List<Quiz>? quizzes,
    List<Quiz>? quizzesAnswered,
    UnitAchived? unitAchived,
    StageAchieved? stageAchieved,
    Unit? positionUnit,
    Stage? positionStage,
    bool? isLoading,
  }) {
    return ResultState(
      result: result ?? this.result,
      quizzes: quizzes ?? this.quizzes,
      quizzesAnswered: quizzesAnswered ?? this.quizzesAnswered,
      unitAchived: unitAchived ?? this.unitAchived,
      stageAchieved: stageAchieved ?? this.stageAchieved,
      positionUnit: positionUnit ?? this.positionUnit,
      positionStage: positionStage ?? this.positionStage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
