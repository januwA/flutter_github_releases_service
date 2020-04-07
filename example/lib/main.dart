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

  bool _laoding = false;
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
            _laoding ? CircularProgressIndicator() : SizedBox(),
            SizedBox(height: 8),
            FutureBuilder(
              future: grs.initialized,
              builder: (c, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  return RaisedButton(
                    onPressed: () async {
                      setState(() {
                        _laoding = true;
                      });
                      try {
                        print('latestVersion: ' + await grs.latestVersion);
                        print('localVersion: ' + await grs.localVersion);
                        print('NeedUpdate: ' +
                            (await grs.isNeedUpdate).toString());
                      } catch (e) {} finally {
                        setState(() {
                          _laoding = false;
                        });
                      }
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
          ],
        ),
      ),
    );
  }
}
