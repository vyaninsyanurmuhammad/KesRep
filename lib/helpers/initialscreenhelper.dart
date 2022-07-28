part of 'helpers.dart';

class InitialScreenHelper {
  static Future<int?>? initialScreen() async {
    SharedPreferences? preferences;
    preferences = await SharedPreferences.getInstance();
    int? initScreen = preferences.getInt("initScreen");
    await preferences.setInt("initScreen", 1);

    return initScreen;
  }
}
