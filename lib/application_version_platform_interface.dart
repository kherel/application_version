import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'application_version_method_channel.dart';

abstract class ApplicationVersionPlatform extends PlatformInterface {
  /// Constructs a ApplicationVersionPlatform.
  ApplicationVersionPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApplicationVersionPlatform _instance = MethodChannelApplicationVersion();

  /// The default instance of [ApplicationVersionPlatform] to use.
  ///
  /// Defaults to [MethodChannelApplicationVersion].
  static ApplicationVersionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ApplicationVersionPlatform] when
  /// they register themselves.
  static set instance(ApplicationVersionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
