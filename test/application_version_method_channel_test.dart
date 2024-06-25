import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:application_version/application_version_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelApplicationVersion platform = MethodChannelApplicationVersion();
  const MethodChannel channel = MethodChannel('application_version');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getVersion(), '42');
  });
}
