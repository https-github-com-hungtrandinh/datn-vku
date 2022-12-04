import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreference {
  static const tokensAccess ="TOKEN_ACCESS";
  static const tokenRefresh ="TOKEN_REFRESH";
  static const timeToken ="TIME_TOKEN";
  static const time=1800000;

  Future<dynamic> get(String key);

  Future set<T>(String key, T value);

  Future remove(String key);
}

class SharedPreferenceImpl implements SharedPreference {
  @override
  Future get(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future set<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case String:
        return await prefs.setString(key, value.toString());
      case bool:
        return await prefs.setBool(key, value as bool);
    }
  }

  @override
  Future remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
