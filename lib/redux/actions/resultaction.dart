part of 'actions.dart';

class LoadResultScoreAction {
  final double? result;

  final List<Quiz>? quizzes;
  final List<Quiz>? quizzesAnswered;

  final StageAchieved? stageAchieved;
  final UnitAchived? unitAchived;
  final Unit? positionUnit;
  final Stage? positionStage;

  LoadResultScoreAction({
    this.quizzes,
    this.quizzesAnswered,
    this.result,
    this.stageAchieved,
    this.unitAchived,
    this.positionUnit,
    this.positionStage,
  });
}

class ClearResultScoreAction {}

class IsLoadingResultAction {
  final bool? isLoading;

  IsLoadingResultAction({this.isLoading});
}
