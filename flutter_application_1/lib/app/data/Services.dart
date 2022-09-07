import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPrefferenc {
  static SharedPreferences? _preferences;
  static String keyname = "email";
  static Future onit() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future saveId(String n) {
    return _preferences!.setString(keyname, n);
  }

  static String getId() {
    return _preferences!.getString(keyname) ?? "";
  }

  static clear() async {
    await _preferences!.clear();
  }
}
