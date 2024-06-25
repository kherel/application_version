class VersionData implements Comparable<VersionData> {
  final int? buildNumber;
  final String semantic;

  const VersionData._({
    this.buildNumber,
    required this.semantic,
  });

  factory VersionData.parce(String version) {
    final parts = version.split('+');

    var semantic = parts[0];
    final buildNumber = parts.length > 1 ? int.tryParse(parts[1]) : null;

    final semanticParts = semantic.split('.');
    while (semanticParts.length < 3) {
      semanticParts.add('0');
    }
    semantic = semanticParts.join('.');

    return VersionData._(
      buildNumber: buildNumber,
      semantic: semantic,
    );
  }

  @override
  String toString() {
    if (buildNumber == null) {
      return semantic;
    }
    return '$semantic+$buildNumber';
  }

  @override
  int compareTo(VersionData other) {
    final comparison = _compareSemanticVersions(semantic, other.semantic);
    if (comparison != 0) {
      return comparison;
    }

    if (buildNumber == null || other.buildNumber == null) {
      return 0;
    }
    return buildNumber!.compareTo(other.buildNumber!);
  }

  bool operator >(VersionData other) => compareTo(other) > 0;
  bool operator <(VersionData other) => compareTo(other) < 0;
  bool operator >=(VersionData other) => compareTo(other) >= 0;
  bool operator <=(VersionData other) => compareTo(other) <= 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is VersionData && compareTo(other) == 0;
  }

  @override
  int get hashCode => semantic.hashCode ^ (buildNumber ?? 0).hashCode;

  static int _compareSemanticVersions(String a, String b) {
    final aParts = a.split('.').map(int.parse).toList();
    final bParts = b.split('.').map(int.parse).toList();

    for (var i = 0; i < aParts.length && i < bParts.length; i++) {
      final comparison = aParts[i].compareTo(bParts[i]);
      if (comparison != 0) {
        return comparison;
      }
    }
    return aParts.length.compareTo(bParts.length);
  }
}
