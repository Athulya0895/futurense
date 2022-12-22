import 'dart:convert';

import 'package:futurensemobileapp/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String tokenKey = 'tokenkey';
  static const String userIdKey = 'userID';
  static const String userKey = 'userKey';
  static const String userTypeKey = 'userTypeKey';
  static const String firsttimeLoginKey = 'firsttimeLoginKey';
  static const String isMentorKey = 'isMentorKey';

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

  //user Id//
  String? get userId => _prefs!.getString(userIdKey);

  set userId(String? token) {
    _prefs?.setString(userIdKey, token!);
  }

  void removeUserId() {
    _prefs?.remove(userIdKey);
  }

//usertype

  String? get userType => _prefs!.getString(userTypeKey);

  set userType(String? type) {
    _prefs!.setString(userTypeKey, type!);
  }

  //check first time login
  bool get firsttimeLogin => _prefs!.getBool(firsttimeLoginKey) ?? false;
  set firsttimeLogin(bool value) {
    _prefs!.setBool(firsttimeLoginKey, value);
  }

  //check the Role is mentor or mentee
  bool get role => _prefs!.getBool(isMentorKey) ?? false;
  set role(bool value) {
    _prefs!.setBool(isMentorKey, value);
  }

  UserModel? get user {
    try {
      if (_prefs!.containsKey(userKey)) {
        final jsonData = jsonDecode(_prefs!.getString(userKey)!);
        return UserModel.fromJson(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  set user(UserModel? user) {
    _prefs!.setString(userKey, jsonEncode(user!.toJson()));
  }
  //  set user(UserModel? user) {
  //   _prefs!.setString(userKey, jsonEncode(user!.toJson()));
  // }

  //Remove all
  void removeAll() {
    _prefs!.remove(userKey);
    removeToken();
  }
}
