part of 'redux.dart';

class PembahasanState {
  List<Quiz>? quizzes;
  List<Quiz>? quizzesAnswered;

  PembahasanState({
    this.quizzes,
    this.quizzesAnswered,
  });

  PembahasanState.initialState() {
    quizzes = [];
    quizzesAnswered = [];
  }

  PembahasanState copyWith({
    List<Quiz>? quizzes,
    List<Quiz>? quizzesAnswered,
  }) {
    return PembahasanState(
      quizzes: quizzes ?? this.quizzes,
      quizzesAnswered: quizzesAnswered ?? this.quizzesAnswered,
    );
  }
}
