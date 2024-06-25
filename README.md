# application_version

[![Pub](https://img.shields.io/pub/v/application_version.svg)](https://pub.dartlang.org/packages/application_version)

A Flutter plugin to retrieve the application's version and build number for both Android and iOS.

## Features

- **Get App Version**: Retrieve the app's version and build number.
- **VersionData Class**:
  - **Parsing**: Parses version strings and ensures semantic versioning (e.g., "1.0" becomes "1.0.0").
  - **Comparison**: Implements `Comparable<VersionData>` interface for comparing versions.
  - **Equality**: Overrides `==` and `hashCode` for proper equality checks and use in collections.
  - **String Representation**: Provides a `toString` method to display the version in a readable format.

## Why This Project?

Many developers use the `package_info` package, which provides a wide range of features. However, the extensive functionality of `package_info` comes with many dependencies that can potentially conflict with other packages you use. Therefore, this small package was created to do **just one thing**: show the version of your application. It aims to be lightweight with minimal dependencies, reducing the risk of conflicts.

## Installation

Add `application_version` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
 application_version: "^0.0.1"
```

### How To Use

Import the following package in your dart file

```dart
import 'package:application_version/application_version.dart';

 // then you need it:
 VersionData? version = await ApplicationVersion.getVersion();
```

### VersionData class

The VersionData class includes methods for comparison, which can be useful in scenarios where you receive a minimum required version for an update from the backend.

```dart
  final version1 = VersionData.parse('1.2+100');
  final version2 = VersionData.parse('1.2.0+101');
  final version3 = VersionData.parse('1.3');
  final version4 = VersionData.parse('1.2.0')

  print(version1 < version2); // true
  print(version1 > version3); // false
  print(version2 >= version1); // true
  print(version3 <= version2); // false
  print(version1 == version4); // true The build number is ignored during comparison if one of the objects does not have it.

  // Example of checking if the current version meets the minimum required version
  final currentVersion = VersionData.parse('2.0.1');
  final minRequiredVersion = VersionData.parse('2.0.0');

  if (currentVersion >= minRequiredVersion) {
    print('Current version meets the minimum required version.');
  } else {
    print('Current version does not meet the minimum required version.');
  }

```
