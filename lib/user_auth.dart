import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserAuth {
  // ? vars ? //
  String baseUrl;
  String userName, userPass;

  ///------------------------------------
  /// User : init
  ///------------------------------------
  /// initialize variables
  init({
    @required String apiBaseUrl,
    @required String userNameParam,
    @required String passwordParam,
  }) {
    baseUrl = apiBaseUrl;
    userName = userNameParam;
    userPass = passwordParam;
  }

  ///------------------------------------
  /// User : Login
  ///------------------------------------
  /// return user data
  Future<dynamic> login({
    @required String username,
    @required String password,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(
        baseUrl + "/user/login",
        body: {
          userName: username,
          userPass: password,
        },
      );
      print((response.request));
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
