# Changelog

## [0.0.1] - 2024-06-24

### Added
- Initial release of `application_version` plugin.
- Added support for retrieving the app version and build number on both Android and iOS.
  - **Android**: Fetches version information from `PackageInfo`.
  - **iOS**: Fetches version information from `Info.plist`.
- Implemented `VersionData` class in Dart with the following features:
  - **Parsing**: Parses version strings and ensures semantic versioning (e.g., "1.0" becomes "1.0.0").
  - **Comparison**: Implements the `Comparable<VersionData>` interface for comparing versions.
  - **Equality**: Overrides `==` and `hashCode` for proper equality checks and use in collections.
  - **String Representation**: Provides a `toString` method to display the version in a readable format.
