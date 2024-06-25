package com.kherel.application_version

import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ApplicationVersionPlugin */
class ApplicationVersionPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "application_version")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getVersion") {
      try {
        val context = flutterPluginBinding.applicationContext
        val pInfo: PackageInfo = context.packageManager.getPackageInfo(context.packageName, 0)
        val version = pInfo.versionName
        val buildNumber = pInfo.versionCode.toString()
        result.success("$version+$buildNumber")
      } catch (e: PackageManager.NameNotFoundException) {
        e.printStackTrace()
        result.error("UNAVAILABLE", "Package info not available.", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}