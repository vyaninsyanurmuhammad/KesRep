part of 'views.dart';

class PembahasanViewModel {
  final List<Quiz>? quizzes;
  final List<Quiz>? quizzesAnswered;

  String Function(String)? jawaban;
  bool Function(String)? isImageJawaban;
  bool Function(String)? isCorrect;

  PembahasanViewModel({
    this.quizzes,
    this.quizzesAnswered,
    this.isImageJawaban,
    this.jawaban,
    this.isCorrect,
  });

  factory PembahasanViewModel.create(Store<AppState> store) {
    _jawaban(String id) {
      String _jawaban = '';
      List<Quiz>? _quizzesAnswered =
          store.state.pembahasanState?.quizzesAnswered;

      for (var i = 0; i < _quizzesAnswered!.length; i++) {
        if (_quizzesAnswered[i].id == id) {
          _jawaban = _quizzesAnswered[i].pilihan![0].data!;
        }
      }

      return _jawaban;
    }

    _isImageAnswered(String jawaban) {
      bool _isImage = false;

      var _split = jawaban.split('://');

      for (var i = 0; i < _split.length; i++) {
        if (_split[i] == 'http' || _split[i] == 'https') {
          _isImage = true;
        }
      }

      return _isImage;
    }

    _isCorrect(String id) {
      bool _isFound = false;
      bool _isCorrect = true;

      List<Quiz>? _quizzesAnswered =
          store.state.pembahasanState?.quizzesAnswered;

      if (_quizzesAnswered!.isEmpty) {
        _isCorrect = false;
      } else {
        for (var i = 0; i < _quizzesAnswered.length; i++) {
          if (_quizzesAnswered[i].id == id) {
            _isFound = true;
          }
        }
      }
      if (_isFound == true) {
        for (var i = 0; i < _quizzesAnswered.length; i++) {
          if (_quizzesAnswered[i].id == id) {
            _isCorrect = _quizzesAnswered[i].pilihan![0].isRight!;
          }
        }
      } else {
        _isCorrect = false;
      }

      return _isCorrect;
    }

    return PembahasanViewModel(
      quizzes: store.state.pembahasanState?.quizzes,
      quizzesAnswered: store.state.pembahasanState?.quizzesAnswered,
      isImageJawaban: _isImageAnswered,
      jawaban: _jawaban,
      isCorrect: _isCorrect,
    );
  }
}
