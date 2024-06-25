import Flutter
import UIKit

public class ApplicationVersionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "application_version", binaryMessenger: registrar.messenger())
    let instance = ApplicationVersionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getVersion") {
      if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
         let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
        result("\(version)+\(buildNumber)")
      } else {
        result(FlutterError(code: "UNAVAILABLE", message: "Version info not available", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}

