import 'package:flutter/material.dart';
import 'package:flutter_github_releases_service/dto/github_releases/github_releases.dto.dart';
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
  GithubReleasesService githubReleasesService = GithubReleasesService(
    owner: 'januwA',
    repo: 'flutter_anime_app',
  );

  Future<GithubReleasesDto> get latest => githubReleasesService.latest;

  @override
  void dispose() {
    githubReleasesService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            print(
                'latestVersion: ' + await githubReleasesService.latestVersion);
            print('localVersion: ' + await githubReleasesService.localVersion);
            print(await githubReleasesService.isNeedUpdate);

            if (await githubReleasesService.isNeedUpdate) {
              var _latest = await latest;

              try {
                githubReleasesService.downloadApk(
                  downloadUrl: _latest.assets.first.browserDownloadUrl,
                  apkName: _latest.assets.first.name,
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
