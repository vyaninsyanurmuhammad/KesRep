part of 'redux.dart';

class PembahasanState {
  List<Quiz>? quizzes;
  List<Quiz>? quizzesAnswered;
  String? imageOpen;
  bool? isImageOpen;

  PembahasanState({
    this.quizzes,
    this.quizzesAnswered,
    this.imageOpen,
    this.isImageOpen,
  });

  PembahasanState.initialState() {
    quizzes = [];
    quizzesAnswered = [];
    imageOpen = null;
    isImageOpen = false;
  }

  PembahasanState copyWith({
    List<Quiz>? quizzes,
    List<Quiz>? quizzesAnswered,
    String? imageOpen,
    bool? isImageOpen,
  }) {
    return PembahasanState(
      quizzes: quizzes ?? this.quizzes,
      quizzesAnswered: quizzesAnswered ?? this.quizzesAnswered,
      imageOpen: imageOpen ?? this.imageOpen,
      isImageOpen: isImageOpen ?? this.isImageOpen,
    );
  }
}
