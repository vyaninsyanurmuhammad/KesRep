part of 'redux.dart';

class MateriState {
  Materi? materi;

  MateriState({
    this.materi,
  });

  MateriState.initialState() {
    materi = Materi();
  }

  MateriState copyWith({
    Materi? materi,
  }) {
    return MateriState(
      materi: materi ?? this.materi,
    );
  }
}
