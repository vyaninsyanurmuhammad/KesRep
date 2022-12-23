part of 'helpers.dart';

class ScoreHelper {
  static String scoreDecider({required int score}) {
    String _medal = '';

    if (score < 60) {
      _medal = MedalHelper.bronze;
    } else if (score < 80) {
      _medal = MedalHelper.silver;
    } else {
      _medal = MedalHelper.gold;
    }
    return _medal;
  }

  static double? bestScore({required scores}) {
    double _best = 0.0;
    if (scores != null) {
      List<int> _scores = [...?scores];
      _best = _scores.reduce(max).toDouble();
    }
    return _best;
  }
}
