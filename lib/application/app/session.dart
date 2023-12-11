import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_serasi_raya/data/models/user/user_model.dart';
import 'package:test_serasi_raya/domain/entities/user.dart';

class Session {
  static Future<SharedPreferences> prefs =
      SharedPreferences.getInstance().then((SharedPreferences prefs) => prefs);

  static Future<bool> setUserToken({required String token}) async {
    SharedPreferences prefs_ = await prefs;
    return await prefs_.setString("token", token);
  }

  static Future<String> get tokenUser async {
    SharedPreferences prefs_ = await prefs;

    String? token = prefs_.getString("token");
    return token!;
  }

  static Future<bool> get isLogged async {
    SharedPreferences prefs_ = await prefs;

    String? token = prefs_.getString("token");
    return token != null ? true : false;
  }

  static Future<bool> setUserSessions({required User userData}) async {
    SharedPreferences prefs_ = await prefs;
    String user = json.encode(userData);
    return await prefs_.setString("userdata", user);
  }

  static Future<User?> get userData async {
    SharedPreferences prefs_ = await prefs;

    String? userData_ = prefs_.getString("userdata");

    if (userData_ == null) {
      return null;
    } else {
      UserModel user = UserModel.fromJson(json.decode(userData_));
      return user;
    }
  }
}
