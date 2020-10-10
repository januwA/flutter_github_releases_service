library flutter_github_releases_service;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:ajanuw_http/ajanuw_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_github_releases_service/releases_dto.dart';
import 'package:package_info/package_info.dart';
import 'package:path/path.dart' as path;
import 'package:install_plugin/install_plugin.dart' show InstallPlugin;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import 'version_xyz.dart';

export 'version_xyz.dart';

/// gitee
/// https://gitee.com/api/v5/repos/januwA/flutter_anime_app/releases
/// https://gitee.com/api/v5/repos/januwA/flutter_anime_app/releases/latest

class GithubReleasesService {
  static final String github = 'https://api.github.com/repos';
  static final String gitee = 'https://gitee.com/api/v5/repos';

  Completer<void> _initialized = Completer();

  /// 初始化后才能使用
  Future<void> get initialized => _initialized.future;

  /// 用户名
  final String owner;

  /// 仓库名
  final String repo;

  final _api = AjanuwHttp();

  String get latestUrl => '$owner/$repo/releases/latest';

  /// release 最后的版本
  ReleasesDto latest;

  /// 当前app的包信息
  PackageInfo pinfo;

  GithubReleasesService({
    @required this.owner,
    @required this.repo,
    String api,
  }) {
    _api.config.baseURL = api ?? github;
    _init();
  }

  _init() async {
    // 获取releases latest
    try {
      var r = await _api.get(latestUrl);
      if (r.statusCode != HttpStatus.ok) {
        throw '[GithubReleasesService] Error: latest $latestUrl statusCode ${r.statusCode}';
      }
      latest = ReleasesDto.fromJson(jsonDecode(r.body));
    } catch (e) {
      rethrow;
    }

    // app包信息
    pinfo = await PackageInfo.fromPlatform();

    // 初始化flutter_download
    await FlutterDownloader.initialize();
    _initialized.complete();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) async {
      String id = data[0];
      DownloadTaskStatus status = data[1];

      if (status == DownloadTaskStatus.failed) {
        return Future.error('url $_downloadUrl, DownloadTaskStatus $status');
      }
      if (_taskId == id && status == DownloadTaskStatus.complete) {
        File df = File(path.joinAll([_savedDir.path, _apkName]));
        if (await df.exists()) {
          _installApk(df.path, packageName);
        }
      }
    });
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  static void _downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  String _downloadUrl;
  String _taskId;
  Directory _savedDir;
  String _apkName;

  ReceivePort _port = ReceivePort();

  bool _permissisonReady = false;

  /// latest version
  String get latestVersion => latest.tagName;

  /// local version
  String get localVersion => pinfo.version;

  /// com.xxx
  String get packageName => pinfo.packageName;

  /// Note: To use this property your version control must be standard x.y.z semantics
  ///
  /// Otherwise you need to judge for yourself
  ///
  /// See slso:
  ///
  /// * [Semantic Versioning 2.0.0](https://semver.org/)
  bool get isNeedUpdate => VersionXYZ(latestVersion) > VersionXYZ(localVersion);

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
    _permissisonReady = await _checkPermission();
    if (!_permissisonReady) return;
    _apkName = apkName;
    _downloadUrl = downloadUrl;
    var savedDir = await _createSavePath();
    _taskId = await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: savedDir,
      showNotification:
          true, //show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  Future<String> _createSavePath() async {
    _savedDir = await getExternalStorageDirectory();
    if (!await _savedDir.exists()) _savedDir.create();
    return _savedDir.path;
  }

  /// 安装指定路径的apk文件
  Future<void> _installApk(String p, String packageName) async {
    InstallPlugin.installApk(p, packageName);
  }

  /// 检查权限，没有则提示用户给予权限
  Future<bool> _checkPermission() async {
    if (Platform.isAndroid) {
      // 检查当前权限状态。
      var permission = Permission.storage;
      PermissionStatus _permissionStatus = await permission.status;

      if (_permissionStatus != PermissionStatus.granted) {
        // 没有权限，发起请求权限
        _permissionStatus = await permission.request();
        return _permissionStatus == PermissionStatus.granted;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  void dispose() {
    FlutterDownloader.registerCallback(null);
  }
}
