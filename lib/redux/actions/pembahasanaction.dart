part of 'actions.dart';

class LoadPembahasanQuizAction {
  final List<Quiz>? quizzes;
  final List<Quiz>? quizzesAnswered;

  LoadPembahasanQuizAction({this.quizzes, this.quizzesAnswered});
}

class IsImagePembahasanOpenAction {
  final bool? isOpen;
  final String? image;

  IsImagePembahasanOpenAction({this.image, this.isOpen});
}
