import 'dart:convert';
import 'package:http/http.dart' as http;

class UserAuth {
  // ? vars ? //
  String baseUrl;
  var _prefs;
  String loginUrl = "/user/login";
  String registerUrl = "/user/register";
  String checkUrl = "/user/details";
  String logoutUrl = "/user/logout";

  ///------------------------------------
  /// User : init
  ///------------------------------------
  /// initialize variables
  init({
    String apiBaseUrl,
    bool store = false,
    prefs,
    String loginUrl = "/user/login",
    String registerUrl = "/user/register",
    String checkUrl = "/user/details",
    String logoutUrl = "/user/logout",
  }) async {
    baseUrl = apiBaseUrl;
    if (store && prefs != null) {
      _prefs = prefs;
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
    String usernameVar,
    String usernameVal,
    String password,
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
      if (_prefs != null) {
        _prefs.setString('user', json.encode(data['user']));
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
  Future<dynamic> register({Map form}) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(
        baseUrl + registerUrl,
        body: form,
      );
      // ---- Response ---- //
      var data = json.decode(response.body);
      if (_prefs != null) {
        _prefs.setString('user', json.encode(data['user']));
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
    if (_prefs.getString('user') != null) {
      return json.decode(_prefs.getString('user'));
    } else {
      return null;
    }
  }

  ///------------------------------------
  /// User : Check
  ///------------------------------------
  /// return user data
  Future<dynamic> check({
    String type,
    String token,
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
    String type,
    String token,
  }) async {
    try {
      // ---- API Call ---- //
      var response = await http.post(baseUrl + logoutUrl, headers: {
        'Authorization': type + token,
      });

      // ---- Response ---- //
      if (response.statusCode == 200) {
        _prefs.clear();
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
