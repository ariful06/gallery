
import 'package:gallery/core/pref/pref_key.dart';
import 'package:preferences/preference_service.dart';
class AppPreference {
  static const String _PREF_PREFIX = 'flutter_core_pref';

  Future<void> init() async {
    await PrefService.init(prefix: _PREF_PREFIX);
    PrefService.setDefaultValues({PrefKey.IS_DARK_THEME: true});
  }

  void setString(String key,String value) {
    PrefService.setString(key, value);
  }

  String getString({String? key}) {
    return PrefService.get(key);
  }

  void setInt(String key,int value) {
    PrefService.setInt(key, value);
  }

  int getInt({String? key}) {
    return PrefService.get(key);
  }

  void setBoolean(String key,bool value) {
    PrefService.setBool(key, value);
  }

  bool getBoolean({String? key}) {
    return PrefService.get(key);
  }

  void setDouble(String key,double value) {
    PrefService.setDouble(key, value);
  }

  double getDouble({String? key}) {
    return PrefService.get(key);
  }
}
