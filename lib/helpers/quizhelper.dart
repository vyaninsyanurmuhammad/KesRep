part of 'helpers.dart';

class QuizHelper {
  static List<Quiz> filteredQuizzes({required List<Quiz> quizzes}) {
    List<Quiz> filteredQuizzes = [];

    quizzes.shuffle();

    for (var i = 0; i < 10; i++) {
      filteredQuizzes.add(quizzes[i]);
    }

    return filteredQuizzes;
  }
}
