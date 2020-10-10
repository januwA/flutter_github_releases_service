# flutter_github_releases_service

Use github releases to update the app.

Note: This has only been tested on Android.

# This library is developed on the `flutter master` branch

## install
```
dependencies:
  flutter_github_releases_service:
```

## Configure Application

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

    <!-- io.flutter.app.FlutterApplication is an android.app.Application that
         calls FlutterMain.startInitialization(this); in its onCreate method.
         In most cases you can leave this as-is, but you if you want to provide
         additional functionality it is fine to subclass or reimplement
         FlutterApplication and put your custom class here. -->
    <application 
      android:name="io.flutter.app.FlutterApplication" 
      android:label="example" 
      android:icon="@mipmap/ic_launcher">
        <activity 
          android:name=".MainActivity" 
          android:launchMode="singleTop" 
          android:theme="@style/LaunchTheme" 
          android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode" 
          android:hardwareAccelerated="true" 
          android:windowSoftInputMode="adjustResize">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data android:name="flutterEmbedding" android:value="2" />
        
        <!-- new -->
        <provider 
          android:name="vn.hunghd.flutterdownloader.DownloadedFileProvider" 
          android:authorities="${applicationId}.flutter_downloader.provider" 
          android:exported="false" 
          android:grantUriPermissions="true">
            <meta-data 
              android:name="android.support.FILE_PROVIDER_PATHS" 
              android:resource="@xml/provider_paths"/>
        </provider>

        <provider 
          android:name="androidx.work.impl.WorkManagerInitializer" 
          android:authorities="${applicationId}.workmanager-init" 
          android:enabled="false" 
          android:exported="false" />

        <provider 
          android:name="vn.hunghd.flutterdownloader.FlutterDownloaderInitializer" 
          android:authorities="${applicationId}.flutter-downloader-init" 
          android:exported="false">
            <!-- changes this number to configure the maximum number of concurrent tasks -->
            <meta-data 
              android:name="vn.hunghd.flutterdownloader.MAX_CONCURRENT_TASKS" 
              android:value="5" />
        </provider>
        <!-- new -->
        
    </application>
</manifest>
```


## Usage example:
```dart
import 'package:flutter_github_releases_service/flutter_github_releases_service.dart';

GithubReleasesService grs = GithubReleasesService(
  owner: 'januwA',
  repo: 'flutter_anime_app',
  api: GithubReleasesService.github,
);


@override
void dispose() {
  grs.dispose();
  super.dispose();
}


FutureBuilder(
  future: grs.initialized,
  builder: (c, snap) {
    if (snap.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snap.connectionState == ConnectionState.done) {
      return RaisedButton(
        onPressed: () async {
          print('latestVersion: ' + grs.latestVersion);
          print('localVersion: ' + grs.localVersion);
          print('NeedUpdate: ' + (grs.isNeedUpdate).toString());

          if (grs.isNeedUpdate) {
            try {
              grs.downloadApk(
                downloadUrl: grs.latest.assets.first.browserDownloadUrl,
                apkName: grs.latest.assets.first.name,
              );
            } catch (e) {
              print('Install Error: $e');
            }
          }
        },
        child: Text('Test'),
      );
    }
    return SizedBox();
  },
)
```