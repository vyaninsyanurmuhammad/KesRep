part of 'reducers.dart';

final ingameReducer = combineReducers<InGameState?>([
  TypedReducer<InGameState?, LoadQuizAction>(_loadQuizAction),
  TypedReducer<InGameState?, PageQuizControllerAction>(_pageQuizController),
  TypedReducer<InGameState?, NumberOfQuestionAction>(_numberOfQuestion),
  TypedReducer<InGameState?, NextQuizAction>(_nextQuizAction),
  TypedReducer<InGameState?, BackQuizAction>(_backQuizAction),
  TypedReducer<InGameState?, ChooseQuizAction>(_chooseQuizAction),
  TypedReducer<InGameState?, LoadAnswerAction>(_loadAnswerAction),
  TypedReducer<InGameState?, AddAnswerAction>(_addAnswerAction),
  TypedReducer<InGameState?, UpdateAnswerAction>(_updateAnswerAction),
  TypedReducer<InGameState?, ClearInGameAction>(_clearInGameAction),
  TypedReducer<InGameState?, LoadRecordAction>(_loadRecordAction),
  TypedReducer<InGameState?, ClearRecordAction>(_clearRecordAction),
  TypedReducer<InGameState?, IsPlayingSoundAction>(_isPlayingSoundAction),
  TypedReducer<InGameState?, IsLoadingAction>(_isLoadingAction),
  TypedReducer<InGameState?, IsImageOpenAction>(_isImageOpenAction),
]);

InGameState? _loadQuizAction(InGameState? state, LoadQuizAction action) {
  return state?.copyWith(quizzes: action.quizzes);
}

InGameState? _pageQuizController(
    InGameState? state, PageQuizControllerAction action) {
  return state?.copyWith(pageController: action.pageController);
}

InGameState? _numberOfQuestion(
    InGameState? state, NumberOfQuestionAction action) {
  return state?.copyWith(numberOfQuestion: action.numberOfQuestion);
}

InGameState? _nextQuizAction(InGameState? state, NextQuizAction action) {
  return state?.copyWith(
    numberOfQuestion: action.numberOfQuestion,
    pageController: action.pageController,
  );
}

InGameState? _backQuizAction(InGameState? state, BackQuizAction action) {
  return state?.copyWith(
    numberOfQuestion: action.numberOfQuestion,
    pageController: action.pageController,
  );
}

InGameState? _chooseQuizAction(InGameState? state, ChooseQuizAction action) {
  return state?.copyWith(
    numberOfQuestion: action.numberOfQuestion,
    pageController: action.pageController,
  );
}

InGameState? _loadAnswerAction(InGameState? state, LoadAnswerAction action) {
  return state?.copyWith(
    quizzesAnswered: action.quizzesAnswered,
  );
}

InGameState? _addAnswerAction(InGameState? state, AddAnswerAction action) {
  return state?.copyWith(
    quizzesAnswered: [...state.quizzesAnswered!, action.quizAnswered!],
  );
}

InGameState? _updateAnswerAction(
    InGameState? state, UpdateAnswerAction action) {
  List<Quiz>? _quizzesAnswered = state?.quizzesAnswered;

  _quizzesAnswered![_quizzesAnswered
          .indexWhere((element) => element.id == action.quizAnswered!.id)] =
      action.quizAnswered!;

  return state?.copyWith(
    quizzesAnswered: [..._quizzesAnswered],
  );
}

InGameState? _clearInGameAction(InGameState? state, ClearInGameAction action) {
  return state?.copyWith(
    quizzesAnswered: [],
    quizzes: [],
    numberOfQuestion: 1.0,
  );
}

InGameState? _loadRecordAction(InGameState? state, LoadRecordAction action) {
  return state?.copyWith(
    unitAchived: action.unitAchived,
    stageAchieved: action.stageAchieved,
    positionUnit: action.positionUnit,
    positionStage: action.positionStage,
  );
}

InGameState? _clearRecordAction(InGameState? state, ClearRecordAction action) {
  return state?.copyWith(
    unitAchived: UnitAchived(),
    stageAchieved: StageAchieved(),
    positionUnit: Unit(),
    positionStage: Stage(),
  );
}

InGameState? _isPlayingSoundAction(
    InGameState? state, IsPlayingSoundAction action) {
  return state?.copyWith(isPlayingSound: action.isPlayingSound);
}

InGameState? _isLoadingAction(InGameState? state, IsLoadingAction action) {
  return state?.copyWith(isLoading: action.isLoading);
}

InGameState? _isImageOpenAction(InGameState? state, IsImageOpenAction action) {
  return state?.copyWith(
      isImageOpen: action.isImageOpen, imageOpen: action.imageOpen);
}
