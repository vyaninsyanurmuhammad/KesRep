part of 'views.dart';

class MateriViewModel {
  final Materi? materi;

  MateriViewModel({this.materi});

  factory MateriViewModel.create(Store<AppState> store) {
    return MateriViewModel(
      materi: store.state.materiState?.materi,
    );
  }
}
