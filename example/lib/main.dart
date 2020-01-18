import 'package:flutter/material.dart';
import 'package:flutter_github_releases_service/flutter_github_releases_service.dart';

void main() => runApp(MaterialApp(home: HomePage()));

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
        child: FutureBuilder(
          future: grs.initialized,
          builder: (c, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return RaisedButton(
                onPressed: () async {
                  print('latestVersion: ' + await grs.latestVersion);
                  print('localVersion: ' + await grs.localVersion);
                  print(await grs.isNeedUpdate);

                  if (true) {
                    try {
                      grs.downloadApk(
                        downloadUrl:
                            grs.latestSync.assets.first.browserDownloadUrl,
                        apkName: grs.latestSync.assets.first.name,
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
        ),
      ),
    );
  }
}
