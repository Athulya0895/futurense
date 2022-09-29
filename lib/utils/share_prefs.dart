import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String tokenKey = 'tokenkey';

  SharedPreferences? _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Token
  String? get token => _prefs!.getString(tokenKey);

  set token(String? token) {
    _prefs?.setString(tokenKey, token!);
  }

  bool get isLogin => token != null;

  void removeToken() {
    _prefs?.remove(tokenKey);
  }

  //Remove all
  void removeAll() {
    removeToken();
  }
}
