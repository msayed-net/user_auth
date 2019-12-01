import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserAuth {
  // ? vars ? //
  Dio dio = new Dio();
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
    // ---- API Base Url ---- //
    dio.options.baseUrl = baseUrl;

    // ---- Data ---- //
    FormData formData = FormData.from({
      userName: username,
      userPass: password,
    });

    // ---- API Call ---- //
    var response = await dio.post("/user/login", data: formData);

    // ---- Response ---- //
    if (response.statusCode == 200) {
      print(response.data['user']);
    } else {
      print(response.data);
    }
    return response.data['user'];
  }

  ///------------------------------------
  /// User : Check
  ///------------------------------------
  /// return user data
  Future<dynamic> check({
    @required String type,
    @required String token,
  }) async {
    // ---- API Base Url ---- //
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Authorization'] = type + token;

    // ---- API Call ---- //
    var response = await dio.post("/user/details");

    // ---- Response ---- //
    if (response.statusCode == 200) {
      print(response.data['user']);
    } else {
      print(response.data);
    }
    return response.data['user'];
  }

  ///------------------------------------
  /// User : Logout
  ///------------------------------------
  /// return user data
  Future<dynamic> logout({
    @required String type,
    @required String token,
  }) async {
    // ---- API Base Url ---- //
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Authorization'] = type + token;

    // ---- API Call ---- //
    var response = await dio.post("/user/logout");

    // ---- Response ---- //
    if (response.statusCode == 200) {
      print(response.data);
      return true;
    } else {
      print(response.data);
      return false;
    }
  }

  String placeHolder() {
    return 'Not Loaded';
  }
}
