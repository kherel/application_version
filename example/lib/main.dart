import 'package:application_version/version_data.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:application_version/application_version.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VersionData? _version;
  final _applicationVersionPlugin = ApplicationVersion();

  @override
  void initState() {
    super.initState();
    initVersionState();
  }

  Future<void> initVersionState() async {
    VersionData? version;

    try {
      version = await _applicationVersionPlugin.getVersion();
    } on PlatformException {
      version = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  final v1 = VersionData.parce('0.0.1');
  final v2 = VersionData.parce('1.0.0');
  final v3 = VersionData.parce('1.0.0+2');
  final v4 = VersionData.parce('1.0.2');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin application version'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_version\n'),
              if (_version != null) ...[
                Text('Version: ${_version!.semantic}\n'),
                Text('Build number: ${_version!.buildNumber}\n'),
                Text('$v1 > $_version: ${v1 > _version!}\n'),
                Text('$v2 == $_version: ${v2 == _version!}\n'),
                Text('$v3 > $_version: ${v3 > _version!}\n'),
                Text('$v4 > $_version: ${v4 > _version!}\n'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
