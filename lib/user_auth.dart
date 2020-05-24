import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuth {
  // ? vars ? //
  String baseUrl;
  SharedPreferences prefs;
  String loginUrl = "/user/login";
  String registerUrl = "/user/register";
  String checkUrl = "/user/details";
  String logoutUrl = "/user/logout";

  ///------------------------------------
  /// User : init
  ///------------------------------------
  /// initialize variables
  init({
    @required String apiBaseUrl,
    bool store = false,
    String loginUrl = "/user/login",
    String registerUrl = "/user/register",
    String checkUrl = "/user/details",
    String logoutUrl = "/user/logout",
  }) async {
    baseUrl = apiBaseUrl;
    if (store) {
      prefs = await SharedPreferences.getInstance();
    }
    loginUrl = loginUrl;
    registerUrl = registerUrl;
    checkUrl = checkUrl;
    logoutUrl = logoutUrl;
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
        baseUrl + loginUrl,
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
      return data['user'];
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  ///------------------------------------
  /// User : Register
  ///------------------------------------
  /// return user data
  Future<dynamic> register({@required Map form}) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(
        baseUrl + registerUrl,
        body: form,
      );
      // ---- Response ---- //
      var data = json.decode(response.body);
      if (prefs != null) {
        prefs.setString('user', json.encode(data['user']));
      }
      return data['user'];
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  ///------------------------------------
  /// User : Load
  ///------------------------------------
  /// return user data
  Future<dynamic> loadUser() async {
    if (prefs.getString('user') != null) {
      return json.decode(prefs.getString('user'));
    } else {
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
      var response = await http.post(baseUrl + checkUrl, headers: {
        'Authorization': type + token,
      });

      // ---- Response ---- //
      var data = json.decode(response.body);
      return data['user'];
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  ///------------------------------------
  /// User : Logout
  ///------------------------------------
  Future<dynamic> logout({
    @required String type,
    @required String token,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(baseUrl + logoutUrl, headers: {
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
