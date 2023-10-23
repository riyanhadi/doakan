import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:assa_doa/model/model_user.dart';
import 'package:assa_doa/service/auth_service.dart';

class LocalDataService {
  static SharedPreferences? prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
    var userMap = getUser();
    if (userMap != null) {
      AuthService.currentUser = ModelUser.fromJson(userMap);
    }
  }

  static saveUser(Map currentUser) {
    prefs!.setString("current_user", jsonEncode(currentUser));
  }

  static Map<String, dynamic>? getUser() {
    var jsonString = prefs!.getString("current_user");
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }

  static set(String key, String value) {
    prefs!.setString(key, value);
  }

  static String? get(String key) {
    return prefs!.getString(key);
  }

  static clearPref() async {
    await prefs!.clear();
  }
}
