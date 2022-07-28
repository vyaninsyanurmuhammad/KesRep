part of 'reducers.dart';

final resultReducer = combineReducers<ResultState?>([
  TypedReducer<ResultState?, LoadResultScoreAction>(_resultScore),
  TypedReducer<ResultState?, ClearResultScoreAction>(_clearResultScore),
  TypedReducer<ResultState?, IsLoadingResultAction>(_isLoadingResultAction),
]);

ResultState? _resultScore(ResultState? state, LoadResultScoreAction action) {
  return state?.copyWith(
    result: action.result,
    quizzes: action.quizzes,
    quizzesAnswered: action.quizzesAnswered,
    unitAchived: action.unitAchived,
    stageAchieved: action.stageAchieved,
    positionUnit: action.positionUnit,
    positionStage: action.positionStage,
  );
}

ResultState? _clearResultScore(
    ResultState? state, ClearResultScoreAction action) {
  return state?.copyWith(
    result: 0.0,
    quizzes: [],
    quizzesAnswered: [],
    unitAchived: UnitAchived(),
    stageAchieved: StageAchieved(),
    positionUnit: Unit(),
    positionStage: Stage(),
  );
}

ResultState? _isLoadingResultAction(
    ResultState? state, IsLoadingResultAction action) {
  return state?.copyWith(
    isLoading: action.isLoading,
  );
}
