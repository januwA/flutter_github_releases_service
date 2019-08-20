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
