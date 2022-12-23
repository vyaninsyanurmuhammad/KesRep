part of 'redux.dart';

class InGameState {
  List<Quiz>? quizzes;
  List<Quiz>? quizzesAnswered;
  PageController? pageController;
  double? numberOfQuestion;

  StageAchieved? stageAchieved;
  UnitAchived? unitAchived;
  Unit? positionUnit;
  Stage? positionStage;

  bool? isPlayingSound;
  bool? isLoading;
  bool? isImageOpen;

  String? imageOpen;

  RiveAnimationController? characterController;

  InGameState({
    this.quizzes,
    this.quizzesAnswered,
    this.pageController,
    this.numberOfQuestion,
    this.stageAchieved,
    this.unitAchived,
    this.positionUnit,
    this.positionStage,
    this.isPlayingSound,
    this.isLoading,
    this.isImageOpen,
    this.imageOpen,
    this.characterController,
  });

  InGameState.initialState() {
    quizzes = [];
    quizzesAnswered = [];

    pageController = PageController();
    numberOfQuestion = 1.0;

    stageAchieved = StageAchieved();
    unitAchived = UnitAchived();
    positionUnit = Unit();
    positionStage = Stage();

    isPlayingSound = false;

    isLoading = true;
    isImageOpen = false;

    imageOpen = null;

    characterController = OneShotAnimation('idle', autoplay: true);
  }

  InGameState copyWith({
    List<Quiz>? quizzes,
    List<Quiz>? quizzesAnswered,
    PageController? pageController,
    double? numberOfQuestion,
    StageAchieved? stageAchieved,
    UnitAchived? unitAchived,
    Unit? positionUnit,
    Stage? positionStage,
    bool? isPlayingSound,
    bool? isLoading,
    bool? isImageOpen,
    String? imageOpen,
    RiveAnimationController? characterController,
  }) {
    return InGameState(
      quizzes: quizzes ?? this.quizzes,
      quizzesAnswered: quizzesAnswered ?? this.quizzesAnswered,
      pageController: pageController ?? this.pageController,
      numberOfQuestion: numberOfQuestion ?? this.numberOfQuestion,
      stageAchieved: stageAchieved ?? this.stageAchieved,
      unitAchived: unitAchived ?? this.unitAchived,
      positionStage: positionStage ?? this.positionStage,
      positionUnit: positionUnit ?? this.positionUnit,
      isPlayingSound: isPlayingSound ?? this.isPlayingSound,
      isLoading: isLoading ?? this.isLoading,
      isImageOpen: isImageOpen ?? this.isImageOpen,
      imageOpen: imageOpen ?? this.imageOpen,
      characterController: characterController ?? this.characterController,
    );
  }
}
