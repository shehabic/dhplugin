import Flutter
import UIKit

public class SwiftDhpluginPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dhplugin", binaryMessenger: registrar.messenger())
    let instance = SwiftDhpluginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "getPlatformVersion" {
        result("iOS " + UIDevice.current.systemVersion)
    } else {
        result("iOS responded to \(call.method)")
    }
  }
}
