import 'package:shared_preferences/shared_preferences.dart';

// Preference Constants
const String PREF_AUTH_TOKEN= "PREF_AUTH_TOKEN";
const String PREF_USER_DETAIL= "PREF_USER_DETAIL";

class SharedPrefWrapper {
  final Future<SharedPreferences> prefs;

  SharedPrefWrapper(this.prefs);

  Future<String> getString(String key, String defaultValue) async {
    try {
      return (await prefs).getString(key) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  Future<int> getInt(String key, int def) async {
    return (await prefs).getInt(key) ?? def;
  }

  Future<bool> getBoolean(String key, bool def) async {
    return (await prefs).getBool(key) ?? def;
  }

  Future<double> getDouble(String key, {double def: 1}) async {
    return (await prefs).getDouble(key) ?? def;
  }

  Future<void> putBoolean(String key, bool value) async {
    (await prefs).setBool(key, value);
  }

  Future<void> putString(String key, String value) async {
    (await prefs).setString(key, value);
  }

  Future<void> putInt(String key, int value) async {
    (await prefs).setInt(key, value);
  }

  Future<void> putDouble(String key, double value) async {
    (await prefs).setDouble(key, value);
  }

  Future<void> clearPreference() async {
    (await prefs).clear();
  }
}
