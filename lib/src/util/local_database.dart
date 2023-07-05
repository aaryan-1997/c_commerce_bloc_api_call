import 'package:c_commerce_bloc_api_call/src/util/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

LocalDatabase localDatabase = LocalDatabase();

class LocalDatabase {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _prefs;

  setToken(value) {
    _prefs.setString(SpKey.token, value);
  }

  bool isLoggedIn() {
    return _getToken().isNotEmpty;
  }

  String _getToken() {
    return _prefs.getString(SpKey.token) ?? "";
  }
}
