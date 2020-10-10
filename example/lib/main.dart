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
    api: GithubReleasesService.github,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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

                      if (true) {
                        try {
                          grs.downloadApk(
                            downloadUrl:
                                grs.latest.assets.first.browserDownloadUrl,
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
            ),
          ],
        ),
      ),
    );
  }
}
