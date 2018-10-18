import 'dart:async';
import 'package:dhplugin/dhplugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class MyClient {

  String getApiCustomerId() {
    return "";
  }

}

class PluginWebview extends StatelessWidget {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  PluginWebview() {
    flutterWebviewPlugin.onUrlChanged.listen((url) {
      if (url.contains("#")) {
        var data = url.split("#");
        Dhplugin.getData(data[1]).then((response) {
          flutterWebviewPlugin.evalJavascript("window.selfService.notifyData(\"$response\")");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://shehabic.com/flutter",
      withJavascript: true,
    );
  }
}
