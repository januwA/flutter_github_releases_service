# flutter_github_releases_service

Use github releases to update the app.

Note: This has only been tested on Android.

## install
```
dependencies:
  flutter_github_releases_service:
```

## 'android\app\src\main\AndroidManifest.xml'
See also: [flutter_downloader](https://pub.flutter-io.cn/packages/flutter_downloader)
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.example">

    <!-- new -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <!-- new -->
    
    <application android:name="io.flutter.app.FlutterApplication" android:label="example" android:icon="@mipmap/ic_launcher">
        <activity android:name=".MainActivity" android:launchMode="singleTop" android:theme="@style/LaunchTheme" android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode" android:hardwareAccelerated="true" android:windowSoftInputMode="adjustResize">
            <meta-data android:name="io.flutter.app.android.SplashScreenUntilFirstFrame" android:value="true" />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>

        <!-- new -->
        <provider android:name="vn.hunghd.flutterdownloader.DownloadedFileProvider" android:authorities="${applicationId}.flutter_downloader.provider" android:exported="false" android:grantUriPeamissions="true">
            <meta-data android:name="android.support.FILE_PROVIDER_PATHS" android:resource="@xml/provider_paths"/>
        </provider>

        <provider android:name="androidx.work.impl.WorkManagerInitializer" android:authorities="${applicationId}.workmanager-init" android:enabled="false" android:exported="false" />

        <provider android:name="vn.hunghd.flutterdownloader.FlutterDownloaderInitializer" android:authorities="${applicationId}.flutter-downloader-init" android:exported="false">
            <meta-data android:name="vn.hunghd.flutterdownloader.MAX_CONCURRENT_TASKS" android:value="5" />
        </provider>
        <!-- new -->

    </application>
</manifest>
```


## Usage example:
```dart
import 'package:flutter/material.dart';
import 'package:flutter_github_releases_service/flutter_github_releases_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GithubReleasesService grs = GithubReleasesService(
    owner: 'januwA',
    repo: 'flutter_anime_app',
  );
  @override
  void dispose() {
    grs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            print('latestVersion: ' + await grs.latestVersion);
            print('localVersion: ' + await grs.localVersion);
            print(await grs.isNeedUpdate);

            if (await grs.isNeedUpdate) {
              try {
                grs.downloadApk(
                  downloadUrl: grs.latestSync.assets.first.browserDownloadUrl,
                  apkName: grs.latestSync.assets.first.name,
                );
              } catch (e) {
                print('安装失败: $e');
              }
            }
          },
          child: Text('Test'),
        ),
      ),
    );
  }
}
```