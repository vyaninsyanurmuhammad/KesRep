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

  bool? isOffline;
  StreamSubscription? internetconnection;

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
    this.isOffline,
    this.internetconnection,
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

    isOffline = true;

    internetconnection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        isOffline = true;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        isOffline = false;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        isOffline = false;
        store.dispatch(IsHomeOfflineAction(isOffline: isOffline));
      }
    });
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
    bool? isOffline,
    StreamSubscription? internetconnection,
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
      isOffline: isOffline ?? this.isOffline,
    );
  }
}
