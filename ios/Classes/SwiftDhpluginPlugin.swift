import Flutter
import UIKit

public protocol DhPluginListener {
   public func onDataRequested(data: String, result: @escaping FlutterResult)
}

public class SwiftDhpluginPlugin: NSObject, FlutterPlugin {

  private static listener: DhPluginListener? = nil

  public func addListener(listener: DhPluginListener) {
     SwiftDhpluginPlugin.listener = listener
  }

  public func removeListener() {
    SwiftDhpluginPlugin.listener = nil
  }

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
