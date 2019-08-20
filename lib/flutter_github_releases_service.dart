library flutter_github_releases_service;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_github_releases_service/dto/github_releases/github_releases.dto.dart';
import 'package:http/http.dart' as http;
import 'package:package_info/package_info.dart';
import 'package:path/path.dart' as path;
import 'package:install_plugin/install_plugin.dart' show InstallPlugin;
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
  final String baseUrl = 'https://api.github.com/repos';
  String get releasesUrl => '$baseUrl/$owner/$repo/releases';
  String get latestUrl => '$baseUrl/$owner/$repo/releases/latest';

  bool _permissisonReady = false;

  List<GithubReleasesDto> _releases;
  List<GithubReleasesDto> get releasesSync => _releases;
  Future<List<GithubReleasesDto>> get releases async => _releases ?? await getReleases();
  Future<List<GithubReleasesDto>> getReleases() async {
    try {
      var r = await http.get(releasesUrl);
      if (r.statusCode != HttpStatus.ok) {
        return Future.error(
            'GithubReleasesService Error: releases $latestUrl statusCode ${r.statusCode}');
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
  GithubReleasesDto get latestSync => _latest;
  Future<GithubReleasesDto> get latest async => _latest ?? await getLatest();
  Future<GithubReleasesDto> getLatest() async {
    try {
      var r = await http.get(latestUrl);
      if (r.statusCode != HttpStatus.ok) {
        return Future.error(
            'GithubReleasesService Error: latest $latestUrl statusCode ${r.statusCode}');
      }
      _latest = GithubReleasesDto.fromJson(r.body);
      return _latest;
    } catch (e) {
      return Future.error(e);
    }
  }

  /// latest version
  Future<String> get latestVersion async => (await latest).tagName;
  String get latestVersionSync => _latest?.tagName;

  /// local version
  String _localVersion;
  String get localVersionSync => _localVersion;
  Future<String> get localVersion async =>
      _localVersion ?? await _getLocalVersion();
  Future<String> _getLocalVersion() async {
    _localVersion = (await PackageInfo.fromPlatform()).version;
    return _localVersion;
  }

  /// com.xxx
  Future<String> get packageName async =>
      (await PackageInfo.fromPlatform()).packageName;

  /// Note: To use this property your version control must be standard x.y.z semantics
  ///
  /// Otherwise you need to judge for yourself
  ///
  /// See slso:
  ///
  /// * [Semantic Versioning 2.0.0](https://semver.org/)
  Future<bool> get isNeedUpdate async =>
      VersionXYZ(await latestVersion) > VersionXYZ(await localVersion);

  /// download apk and install:
  ///
  /// ```dart
  /// // If there is a new version and the user agrees
  /// if(isNeedUpdate && alert('Do you need to update?')){
  ///   downloadApk(
  ///     downloadUrl: latestSync.assets.first.browserDownloadUrl,
  ///     apkName: latestSync.assets.first.name,
  ///   );
  /// }
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
    // Create if the directory does not exist
    if (!await savedDir.exists()) {
      savedDir.create();
    }
    final taskId = await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: savedDir.path,
      showNotification:
          true, //show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
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
    var v;
    if (xyz is String) {
      v = xyz.split('.').map<int>((s) => int.parse(s)).toList();
    } else if (xyz is List<int>) {
      v = xyz;
    }
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
