part of 'reducers.dart';

final materiReducer = combineReducers<MateriState?>([
  TypedReducer<MateriState?, LoadMateriAction>(_loadMateriAction),
]);

MateriState? _loadMateriAction(MateriState? state, LoadMateriAction action) {
  return state?.copyWith(materi: action.materi);
}
