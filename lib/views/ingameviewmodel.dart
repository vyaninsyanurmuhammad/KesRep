part of 'views.dart';

class InGameViewModel {
  final List<Quiz>? quizzes;
  final List<Quiz>? quizzesAnswered;
  final PageController? pageController;
  final double? numberOfQuestion;

  final StageAchieved? stageAchieved;
  final UnitAchived? unitAchived;
  final Unit? positionUnit;
  final Stage? positionStage;

  final bool? isPlayingSound;

  final bool? isLoading;

  void Function()? nextQuiz;
  void Function()? backQuiz;
  void Function(int)? chooseQuiz;
  void Function(Quiz, Pilihan)? addQuizAnswered;
  bool Function(String, String)? isQuizAnswered;
  bool Function(List<Quiz>, List<Quiz>, int)? isQuestionAnswered;
  void Function()? clearInGameAndRecordAction;
  double Function()? quizScore;
  double Function()? appbarTotalFinished;
  Future<void> Function(String)? playSound;

  final bool? isOffline;

  InGameViewModel({
    this.quizzes,
    this.pageController,
    this.numberOfQuestion,
    this.nextQuiz,
    this.backQuiz,
    this.chooseQuiz,
    this.quizzesAnswered,
    this.addQuizAnswered,
    this.isQuizAnswered,
    this.isQuestionAnswered,
    this.clearInGameAndRecordAction,
    this.quizScore,
    this.appbarTotalFinished,
    this.stageAchieved,
    this.unitAchived,
    this.positionUnit,
    this.positionStage,
    this.isPlayingSound,
    this.playSound,
    this.isLoading,
    this.isOffline,
  });

  factory InGameViewModel.create(Store<AppState> store) {
    _nextQuiz() {
      if (store.state.ingameState?.pageController?.page !=
          store.state.ingameState!.quizzes!.length - 1) {
        store.state.ingameState?.pageController?.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linearToEaseOut);
      }

      store.state.ingameState?.numberOfQuestion =
          store.state.ingameState!.pageController!.page! + 2;

      store.dispatch(NextQuizAction(
          pageController: store.state.ingameState?.pageController,
          numberOfQuestion: store.state.ingameState?.numberOfQuestion));
    }

    _backQuiz() {
      store.state.ingameState?.pageController?.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linearToEaseOut);

      store.state.ingameState?.numberOfQuestion =
          store.state.ingameState?.pageController?.page!;

      store.dispatch(BackQuizAction(
          pageController: store.state.ingameState?.pageController,
          numberOfQuestion: store.state.ingameState?.numberOfQuestion));
    }

    _chooseQuiz(int no) {
      store.state.ingameState?.pageController?.jumpToPage(no);

      store.state.ingameState?.numberOfQuestion =
          store.state.ingameState!.pageController!.page! + 1;

      store.dispatch(ChooseQuizAction(
          pageController: store.state.ingameState?.pageController,
          numberOfQuestion: store.state.ingameState?.numberOfQuestion));
    }

    _addQuizAnswered(Quiz quiz, Pilihan pilihan) {
      List<Quiz>? _quizzesAnswered = store.state.ingameState?.quizzesAnswered;
      bool _exist = false;
      List<Pilihan> _pilihan = [];
      Quiz? _quiz;

      for (var q in _quizzesAnswered!) {
        if (q.id == quiz.id) {
          _exist = true;
        }
      }

      if (_exist == true) {
        for (var q in _quizzesAnswered) {
          if (q.id == quiz.id) {
            _pilihan = q.pilihan!;
          }
        }
        _pilihan[0] = pilihan;

        _quiz = Quiz(
          id: quiz.id,
          tipe: quiz.tipe,
          pilihan: _pilihan,
        );

        store.dispatch(UpdateAnswerAction(quizAnswered: _quiz));
      } else {
        _quiz = Quiz(
          id: quiz.id,
          tipe: quiz.tipe,
          pilihan: [pilihan],
        );

        store.dispatch(AddAnswerAction(quizAnswered: _quiz));
      }
    }

    _isQuizAnswered(String id, String data) {
      List<Quiz>? _quizzesAnswered = store.state.ingameState?.quizzesAnswered;

      bool _selected = false;
      List<Pilihan> _pilihan = [];

      for (var q in _quizzesAnswered!) {
        if (q.id == id) {
          _pilihan = q.pilihan!;
        }
      }

      for (var item in _pilihan) {
        if (item.data == data) {
          _selected = true;
        }
      }

      return _selected;
    }

    _isQuestionAnswered(
        List<Quiz> quizzesAnswered, List<Quiz> quizzes, int index) {
      bool _answered = false;

      for (var item in quizzesAnswered) {
        if (quizzes[index].id == item.id) {
          _answered = true;
        }
      }

      return _answered;
    }

    _clearInGameAndRecordAction() {
      store.dispatch(ClearInGameAction());
      store.dispatch(ClearRecordAction());
    }

    _quizScore() {
      List<Quiz>? _quizzesAnswered = store.state.ingameState?.quizzesAnswered;

      double _scoreOfQuiz = 0.0;
      List<Pilihan> _pilihanAnswered = [];
      for (var item in _quizzesAnswered!) {
        _pilihanAnswered = item.pilihan!;

        if (_pilihanAnswered[0].isRight == true) {
          _scoreOfQuiz += 10;
        } else {
          _scoreOfQuiz += 0;
        }
      }

      return _scoreOfQuiz;
    }

    _appbarTotalFinished() {
      List<Quiz>? _quizzesAnswered = [
        ...?store.state.ingameState?.quizzesAnswered
      ];

      double _total = 0.0;

      if (!_quizzesAnswered.length.isNaN) {
        _total = _quizzesAnswered.length.toDouble();
      }

      return _total;
    }

    _playSound(String sound) async {
      AudioPlayer _audioPlayer = AudioPlayer();
      bool? _isPlayingSound = store.state.ingameState?.isPlayingSound;
      // audioCache.play("sounds/1.mp3");

      String _url = await PlayerHelper.getSoundUrl(
        position: store.state.ingameState!.positionStage!.id!,
        name: sound,
      );

      if (!_isPlayingSound!) {
        store.dispatch(IsPlayingSoundAction(isPlayingSound: true));

        // _audioPlayer.setSourceUrl(_url);

        _audioPlayer.play(UrlSource(_url));

        _audioPlayer.onPlayerComplete.listen((event) {
          store.dispatch(IsPlayingSoundAction(isPlayingSound: false));
        });
      } else {
        _audioPlayer.pause();
        store.dispatch(IsPlayingSoundAction(isPlayingSound: false));
      }
    }

    return InGameViewModel(
      quizzes: store.state.ingameState?.quizzes,
      pageController: store.state.ingameState?.pageController,
      numberOfQuestion: store.state.ingameState?.numberOfQuestion,
      nextQuiz: _nextQuiz,
      backQuiz: _backQuiz,
      chooseQuiz: _chooseQuiz,
      quizzesAnswered: store.state.ingameState?.quizzesAnswered,
      addQuizAnswered: _addQuizAnswered,
      isQuizAnswered: _isQuizAnswered,
      isQuestionAnswered: _isQuestionAnswered,
      clearInGameAndRecordAction: _clearInGameAndRecordAction,
      quizScore: _quizScore,
      appbarTotalFinished: _appbarTotalFinished,
      unitAchived: store.state.ingameState?.unitAchived,
      stageAchieved: store.state.ingameState?.stageAchieved,
      positionUnit: store.state.ingameState?.positionUnit,
      positionStage: store.state.ingameState?.positionStage,
      isPlayingSound: store.state.ingameState?.isPlayingSound,
      playSound: _playSound,
      isLoading: store.state.ingameState?.isLoading,
      isOffline: store.state.ingameState?.isOffline,
    );
  }
}
