import 'package:flutter_test/flutter_test.dart';
import 'package:application_version/application_version.dart';
import 'package:application_version/application_version_platform_interface.dart';
import 'package:application_version/application_version_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockApplicationVersionPlatform
    with MockPlatformInterfaceMixin
    implements ApplicationVersionPlatform {

  @override
  Future<String?> getVersion() => Future.value('42');
}

void main() {
  final ApplicationVersionPlatform initialPlatform = ApplicationVersionPlatform.instance;

  test('$MethodChannelApplicationVersion is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelApplicationVersion>());
  });

  test('getPlatformVersion', () async {
    ApplicationVersion applicationVersionPlugin = ApplicationVersion();
    MockApplicationVersionPlatform fakePlatform = MockApplicationVersionPlatform();
    ApplicationVersionPlatform.instance = fakePlatform;

    expect(await applicationVersionPlugin.getVersion(), '42');
  });
}
