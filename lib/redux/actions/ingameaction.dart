part of 'actions.dart';

class LoadQuizAction {
  final List<Quiz>? quizzes;

  LoadQuizAction({this.quizzes});
}

class PageQuizControllerAction {
  final PageController? pageController;

  PageQuizControllerAction({this.pageController});
}

class NumberOfQuestionAction {
  final double? numberOfQuestion;

  NumberOfQuestionAction({this.numberOfQuestion});
}

class NextQuizAction {
  final PageController? pageController;
  final double? numberOfQuestion;

  NextQuizAction({this.pageController, this.numberOfQuestion});
}

class BackQuizAction {
  final PageController? pageController;
  final double? numberOfQuestion;

  BackQuizAction({this.pageController, this.numberOfQuestion});
}

class ChooseQuizAction {
  final PageController? pageController;
  final double? numberOfQuestion;

  ChooseQuizAction({this.pageController, this.numberOfQuestion});
}

class LoadAnswerAction {
  final List<Quiz>? quizzesAnswered;

  LoadAnswerAction({this.quizzesAnswered});
}

class AddAnswerAction {
  final Quiz? quizAnswered;

  AddAnswerAction({this.quizAnswered});
}

class UpdateAnswerAction {
  final Quiz? quizAnswered;

  UpdateAnswerAction({this.quizAnswered});
}

class ClearInGameAction {}

class LoadRecordAction {
  final StageAchieved? stageAchieved;
  final UnitAchived? unitAchived;
  final Unit? positionUnit;
  final Stage? positionStage;

  LoadRecordAction(
      {this.stageAchieved,
      this.unitAchived,
      this.positionUnit,
      this.positionStage});
}

class ClearRecordAction {}

class IsPlayingSoundAction {
  final bool? isPlayingSound;

  IsPlayingSoundAction({this.isPlayingSound});
}

class IsLoadingAction {
  final bool? isLoading;

  IsLoadingAction({this.isLoading});
}

class IsInGameOfflineAction {
  final bool? isOffline;

  IsInGameOfflineAction({this.isOffline});
}
