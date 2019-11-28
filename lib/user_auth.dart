import 'dart:async';

import 'package:flutter/services.dart';

class UserAuth {
  static const MethodChannel _channel =
      const MethodChannel('user_auth');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
