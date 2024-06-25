import 'package:application_version/version_data.dart';

import 'application_version_platform_interface.dart';

class ApplicationVersion {
  Future<VersionData?> getVersion() async {
    final stringVersion =
        await ApplicationVersionPlatform.instance.getVersion();
    if (stringVersion == null) {
      return null;
    }

    return VersionData.parce(stringVersion);
  }
}
