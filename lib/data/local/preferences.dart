import 'dart:convert';

import 'package:his_frontend/data/repositories/setting/models/output/user_info/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const kUserInfo = "user_info";

// lưu thông tin người dùng vào bộ nhớ cục bộ
  static setUserInfo(UserInfo user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(kUserInfo, jsonEncode(user.toJson()));
  }

// lấy thông  tin user từ bộ nhớ cục bộ
  static Future<UserInfo?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(kUserInfo);
    if (userJson != null) return UserInfo.fromJson(json.decode(userJson));
    return null;
  }
}
