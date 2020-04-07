class VersionXYZ {
  /// 'x.y.z' or [0,1,0]
  ///
  /// ```dart
  /// assert(VersionXYZ('5.0.2') > VersionXYZ('5.0.1'), true);
  /// assert(VersionXYZ('5.0.2') > VersionXYZ([5,0,1]), true);
  /// ```
  ///
  /// See also:
  ///
  /// * [Semantic Versioning 2.0.0](https://semver.org/)
  ///
  VersionXYZ(dynamic xyz) {
    if (xyz is String) {
      _v = xyz.split('.').map<int>((s) => int.parse(s)).toList();
    } else if (xyz is List<int>) {
      _v = xyz;
    }
  }
  
  List<int> _v;
  int get x => _v[0];
  int get y => _v[1];
  int get z => _v[2];

  @override
  String toString() => '$x.$y.$z';

  bool operator >(VersionXYZ other) {
    if (x > other.x) {
      return true;
    } else if (x < other.x) {
      return false;
    } else {
      if (y > other.y) {
        return true;
      } else if (y < other.y) {
        return false;
      } else {
        if (z > other.z) {
          return true;
        } else if (z < other.z) {
          return false;
        } else {
          return false;
        }
      }
    }
  }
}
