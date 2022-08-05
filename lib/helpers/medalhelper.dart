part of 'helpers.dart';

class MedalHelper {
  static String gold = "Gold";
  static String silver = "Silver";
  static String bronze = "Bronze";

  static int medalCount(
      {required String medal, required List<UnitAchived> listUnitAchived}) {
    int _medal = 0;

    List<StageAchieved> _liststageAcived = [];

    for (var i = 0; i < listUnitAchived.length; i++) {
      _liststageAcived.addAll(listUnitAchived[i]
          .stageAchieved!
          .where((element) => element.medalAchieved == medal));
    }

    _medal = _liststageAcived.length;

    return _medal;
  }
}
