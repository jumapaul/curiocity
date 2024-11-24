import 'dart:convert';

import 'package:curiocity/app/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Keys for shared preferences
  static const String ON_BOARD_STATE = "on_board_state";
  static const String KEY_USER = "user_data";
  static const String KEY_TOKEN = "access_token";

  // Save the onboarding state
  static Future<void> saveOnBoardState(bool clicked) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(ON_BOARD_STATE, clicked);
  }

  // Get the onboarding state
  static Future<bool> getOnBoardState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(ON_BOARD_STATE) ?? false;
  }

  // Delete the onboarding state
  static Future<void> deleteOnBoardState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ON_BOARD_STATE);
  }

  // Save user data along with the access token
  static Future<void> saveUser(Map<String, dynamic> response) async {
    final prefs = await SharedPreferences.getInstance();

    // Extract user data and token
    final userData = response['data']['user'];
    userData['accessToken'] = response['data']['accessToken'];

    // Save user data and token in shared preferences
    await prefs.setString(KEY_USER, jsonEncode(userData));
    await prefs.setString(KEY_TOKEN, response['data']['accessToken']);
  }

  // Retrieve user data
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(KEY_USER);

    if (userString != null) {
      try {
        return User.fromJson(jsonDecode(userString));
      } catch (e) {
        print("Error decoding user data: $e");
        return null;
      }
    }

    return null;
  }

  // Retrieve access token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_TOKEN);
  }

  // Save a string value with a specific key
  static Future<void> saveString(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  // Get a string value by key
  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Clear user data and token
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(KEY_USER);
    await prefs.remove(KEY_TOKEN);
  }
}
