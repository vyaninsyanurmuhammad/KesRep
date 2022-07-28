part of 'helpers.dart';

class ScoreHelper {
  static String scoreDecider({required int score}) {
    String _medal = '';

    if (score < 70) {
      _medal = MedalHelper.bronze;
    } else if (score < 80) {
      _medal = MedalHelper.silver;
    } else {
      _medal = MedalHelper.gold;
    }
    return _medal;
  }
}
