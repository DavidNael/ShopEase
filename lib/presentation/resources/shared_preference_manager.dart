import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const String _isDarkMode = 'isDarkMode';

  static Future<bool?> get isDarkMode async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkMode);
  }

  static Future<void> setDarkMode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isDarkMode, value);
  }
}
