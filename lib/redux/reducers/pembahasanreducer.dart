part of 'reducers.dart';

final pembahasanReducer = combineReducers<PembahasanState?>([
  TypedReducer<PembahasanState?, LoadPembahasanQuizAction>(
      _loadPembahasanQuizAction),
]);

PembahasanState? _loadPembahasanQuizAction(
    PembahasanState? state, LoadPembahasanQuizAction action) {
  return state?.copyWith(
    quizzes: action.quizzes,
    quizzesAnswered: action.quizzesAnswered,
  );
}
