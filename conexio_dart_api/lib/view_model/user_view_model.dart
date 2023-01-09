import 'dart:convert';
import 'package:conexio_dart_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel userSharedPre) async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();
    String? objectString = jsonEncode(userSharedPre.user);
    sharedPre.setString("token", userSharedPre.token.toString());
    sharedPre.setString("objectUser", objectString);
    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();
    final String? token = sharedPre.getString('token');
    final String? user = sharedPre.getString('objectUser');
    if (token != null && user != null) {
      Map<String, dynamic> userMap = jsonDecode(user);
      var userInstance = User.fromJson(userMap);
      return UserModel(user: userInstance, token: token.toString());
    }
    return UserModel();
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();
    sharedPre.remove('token');
    sharedPre.remove('objectUser');
    return true;
  }
}
