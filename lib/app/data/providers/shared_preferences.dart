import 'dart:convert';
import 'dart:ffi';

import 'package:curiocity/app/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String ON_BOARD_STATE = "on_board_state";
  static const String KEY_USER = "user_data";
  static const String KEY_TOKEN = "access_token";

  static Future<void> saveOnBoardState(bool clicked) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool(ON_BOARD_STATE, clicked);
  }

  static Future<bool> getOnBoardState() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(ON_BOARD_STATE) ?? false;
  }

  static Future<void> deleteOnBoardState() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("on_board_state");
  }

  static Future<void> saveUser(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();

    //saving user data
    final userData = response['data']['user'];
    userData['accessToken'] = response['data']['accessToken'];

    await prefs.setString(KEY_USER, jsonEncode(userData));

    //Saving token
    await prefs.setString(KEY_TOKEN, response['data']['accessToken']);
  }

  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(KEY_USER);

    if (userString != null) {
      return UserModel.fromJson(jsonDecode(userString));
    }

    return null;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_TOKEN);
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(KEY_USER);
    await prefs.remove(KEY_TOKEN);
  }
}
