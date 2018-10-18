
import 'dart:async';

import 'package:flutter/services.dart';

class Dhplugin {
  static const MethodChannel _channel =
      const MethodChannel('dhplugin');


  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getData(String method) async {
    final String version = await _channel.invokeMethod(method);
    return version;
  }

  doResponse() {
    _channel.invokeMethod("Give me what you have").then((response) {

    });
    _channel.setMethodCallHandler((handler) {

    });
  }
}
