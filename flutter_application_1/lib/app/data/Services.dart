import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPrefferenc {
  static SharedPreferences? _preferences;
  static String keyname = "email";
  static Future onit() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future saveEmail(String n) {
    return _preferences!.setString(keyname, n);
  }

  static String getEmail() {
    return _preferences!.getString(keyname) ?? "";
  }
}
