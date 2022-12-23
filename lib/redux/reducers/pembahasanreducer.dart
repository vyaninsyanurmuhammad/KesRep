part of 'reducers.dart';

final pembahasanReducer = combineReducers<PembahasanState?>([
  TypedReducer<PembahasanState?, LoadPembahasanQuizAction>(
      _loadPembahasanQuizAction),
  TypedReducer<PembahasanState?, IsImagePembahasanOpenAction>(
      _isImagePembahsanOpenAction),
]);

PembahasanState? _loadPembahasanQuizAction(
    PembahasanState? state, LoadPembahasanQuizAction action) {
  return state?.copyWith(
    quizzes: action.quizzes,
    quizzesAnswered: action.quizzesAnswered,
  );
}

PembahasanState? _isImagePembahsanOpenAction(
    PembahasanState? state, IsImagePembahasanOpenAction action) {
  return state?.copyWith(imageOpen: action.image, isImageOpen: action.isOpen);
}
