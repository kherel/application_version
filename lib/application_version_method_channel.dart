import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'application_version_platform_interface.dart';

/// An implementation of [ApplicationVersionPlatform] that uses method channels.
class MethodChannelApplicationVersion extends ApplicationVersionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('application_version');

  @override
  Future<String?> getVersion() async {
    final version = await methodChannel.invokeMethod<String>('getVersion');
    return version;
  }
}
