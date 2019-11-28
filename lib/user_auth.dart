import 'package:dio/dio.dart';

class UserAuth {
  // ? vars ? //
  Dio dio = new Dio();
  String baseUrl;
  String userName, userPass;

  ///------------------------------------
  /// User : init
  ///------------------------------------
  /// initialize variables
  init(apiBaseUrl, username, password) {
    baseUrl = apiBaseUrl;
    userName = username;
    userPass = password;
  }

  ///------------------------------------
  /// User : Login
  ///------------------------------------
  /// return user data
  Future<dynamic> login(name, pass) async {
    // ---- API Base Url ---- //
    dio.options.baseUrl = baseUrl;

    // ---- Data ---- //
    FormData formData = FormData.from({
      userName: name,
      userPass: pass,
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
  Future<dynamic> check(type, token) async {
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
  Future<dynamic> logout(type, token) async {
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
