import 'package:shared_preferences/shared_preferences.dart';

const String _isFirstLaunch = 'isFirstLaunch';

class PreferencesManager {
  factory PreferencesManager() {
    return _incetance;
  }

  PreferencesManager._internal();
  static late final SharedPreferences _preferences;
  static final PreferencesManager _incetance = PreferencesManager._internal();

  void set(SharedPreferences preferences) => _preferences = preferences;

  bool get isFirstLaunch => _preferences.getBool(_isFirstLaunch) ?? true;

  Future<void> setIsFirstLaunch(bool isFirstLaunch) async {
    await _preferences.setBool(_isFirstLaunch, isFirstLaunch);
  }
}
