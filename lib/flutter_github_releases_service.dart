library flutter_github_releases_service;

import 'dart:convert';
import 'dart:io';

import 'package:flutter_github_releases_service/dto/github_releases/github_releases.dto.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:path/path.dart' as path;
import 'package:install_plugin/install_plugin.dart' show InstallPlugin;
import 'package:meta/meta.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class GithubReleasesService {
  GithubReleasesService({
    @required this.owner,
    @required this.repo,
  });

  final String owner;
  final String repo;

  bool _permissisonReady = false;

  List<GithubReleasesDto> _releases;
  String get releasesUrl =>
      'https://api.github.com/repos/$owner/$repo/releases';
  Future<List<GithubReleasesDto>> get releases async =>
      _releases != null ? _releases : await getReleases();
  Future<List<GithubReleasesDto>> getReleases() async {
    try {
      var r = await http.get(releasesUrl);
      if (r.statusCode != HttpStatus.ok) {
        return Future.error(
            'GithubReleasesService Error: Get latest release $latestUrl statusCode ${r.statusCode}');
      }
      List body = jsonDecode(r.body);
      _releases = body
          .map<GithubReleasesDto>(
              (r) => GithubReleasesDto.fromJson(jsonEncode(r)))
          .toList();
      return _releases;
    } catch (e) {
      return Future.error(e);
    }
  }

  GithubReleasesDto _latest;
  String get latestUrl =>
      'https://api.github.com/repos/$owner/$repo/releases/latest';
  Future<GithubReleasesDto> get latest async =>
      _latest != null ? _latest : await getLatest();
  Future<GithubReleasesDto> getLatest() async {
    try {
      var r = await http.get(latestUrl);
      if (r.statusCode != HttpStatus.ok) {
        return Future.error(
            'GithubReleasesService Error: Get latest release $latestUrl statusCode ${r.statusCode}');
      }
      _latest = GithubReleasesDto.fromJson(r.body);
      return _latest;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// latest version
  Future<String> get latestVersion async => (await latest).tagName;

  /// local version
  Future<String> get localVersion async =>
      (await PackageInfo.fromPlatform()).version;

  /// com.xxx
  Future<String> get packageName async =>
      (await PackageInfo.fromPlatform()).packageName;

  /// 注意：使用这个属性你的版本控制必须是标准的x.y.z语义
  ///
  /// 否则你需要自己判断
  ///
  /// 是否需要更新
  ///
  /// See slso:
  ///
  /// * [语义化版本](https://semver.org/lang/zh-CN/)
  Future<bool> get isNeedUpdate async {
    VersionXYZ localXyz = VersionXYZ(await localVersion);
    VersionXYZ latestXyz = VersionXYZ(await latestVersion);
    return latestXyz > localXyz;
  }

  /// 下载:
  ///
  /// ```dart
  /// downloadApk(
  ///   downloadUrl: latest.assets.first.browserDownloadUrl,
  ///   apkName: latest.assets.first.name,
  /// );
  /// ```
  ///
  /// See also:
  ///
  /// * [path_provider](https://pub.flutter-io.cn/packages/path_provider)
  /// * [permission_handler](https://pub.flutter-io.cn/packages/permission_handler)
  /// * [flutter_downloader](https://pub.flutter-io.cn/packages/flutter_downloader)
  Future<void> downloadApk({
    @required String downloadUrl,
    @required String apkName,
  }) async {
    assert(downloadUrl != null);
    assert(apkName != null);

    _permissisonReady = await _checkPermission();
    if (!_permissisonReady) return;

    Directory savedDir = await getExternalStorageDirectory();
    // 目录不存在则创建
    if (!await savedDir.exists()) {
      savedDir.create();
    }
    print('savedDir: ${savedDir.path}');
    final taskId = await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: savedDir.path,
      showNotification: true, // 显示状态栏中的下载进度（适用于Android）
      openFileFromNotification: true, // 点击通知打开下载的文件（适用于Android）
    );
    FlutterDownloader.registerCallback((id, status, progress) async {
      if (status == DownloadTaskStatus.failed) {
        return Future.error('url $downloadUrl DownloadTaskStatus $status');
      }
      if (taskId == id && status == DownloadTaskStatus.complete) {
        File df = File(path.joinAll([savedDir.path, apkName]));
        if (await df.exists()) {
          _installApk(df.path, await packageName);
        }
      }
    });
  }

  /// 安装指定路径的apk文件
  Future<void> _installApk(String p, String packageName) async {
    InstallPlugin.installApk(p, packageName);
  }

  /// 检查权限，没有则提示用户给予权限
  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      // 检查当前权限状态。
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);

      if (permission != PermissionStatus.granted) {
        // 没有权限，发起请求权限
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  dispose() {
    FlutterDownloader.registerCallback(null);
  }
}

class VersionXYZ {
  /// 'x.y.z'
  VersionXYZ(String xyz) {
    List<int> v = xyz.split('.').map<int>((s) => int.parse(s)).toList();
    x = v[0];
    y = v[1];
    z = v[2];
  }

  int x;
  int y;
  int z;

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
