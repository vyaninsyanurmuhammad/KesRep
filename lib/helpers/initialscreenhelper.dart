part of 'helpers.dart';

class InitialScreenHelper {
  static Future<int?>? initialScreen() async {
    SharedPreferences? preferences;
    preferences = await SharedPreferences.getInstance();
    int? initScreen = preferences.getInt("initScreen");

    return initScreen;
  }

  static Future<void> setInitialScreen() async {
    SharedPreferences? preferences;
    preferences = await SharedPreferences.getInstance();
    await preferences.setInt("initScreen", 1);
  }
}
