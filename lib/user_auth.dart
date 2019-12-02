import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  // ? vars ? //
  String baseUrl;
  SharedPreferences prefs;

  ///------------------------------------
  /// User : init
  ///------------------------------------
  /// initialize variables
  init({
    @required String apiBaseUrl,
    bool store = false,
  }) async {
    baseUrl = apiBaseUrl;
    if (store) {
      prefs = await SharedPreferences.getInstance();
    }
    print(prefs);
  }

  ///------------------------------------
  /// User : Login
  ///------------------------------------
  /// return user data
  Future<dynamic> login({
    @required String usernameVar,
    @required String usernameVal,
    @required String password,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(
        baseUrl + "/user/login",
        body: {
          usernameVar: usernameVal,
          'password': password,
        },
      );
      // ---- Response ---- //
      var data = json.decode(response.body);
      if (prefs != null) {
          prefs.setString('user', json.encode(data['user']));
      }
      print(prefs.getString('user'));
      var user1 = json.decode(prefs.getString('user'));
      return data['user'];
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  ///------------------------------------
  /// User : Check
  ///------------------------------------
  /// return user data
  Future<dynamic> loadUser() async {
    if (prefs.getString('user') != null) {
      return json.decode(prefs.getString('user'));
    } else{
      return null;
    }
  }
  ///------------------------------------
  /// User : Check
  ///------------------------------------
  /// return user data
  Future<dynamic> check({
    @required String type,
    @required String token,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(baseUrl + "/user/details", headers: {
        'Authorization': type + token,
      });

      // ---- Response ---- //
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(data['user']);
      } else {
        print(data);
      }
      return data['user'];
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  ///------------------------------------
  /// User : Logout
  ///------------------------------------
  /// return user data
  Future<dynamic> logout({
    @required String type,
    @required String token,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(baseUrl + "/user/logout", headers: {
        'Authorization': type + token,
      });

      // ---- Response ---- //
      if (response.statusCode == 200) {
        prefs.clear();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  String placeHolder() {
    return 'Not Loaded';
  }
}
