import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  final SharedPreferences prefs;
  SharedPrefManager(this.prefs);
  static const String _isDarkMode = 'isDarkMode';

  bool? get isDarkMode  {
    return prefs.getBool(_isDarkMode);
  }

  Future<void> setDarkMode(bool value) async {
    prefs.setBool(_isDarkMode, value);
  }
}
