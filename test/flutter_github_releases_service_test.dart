import 'package:flutter_github_releases_service/flutter_github_releases_service.dart';
import 'package:test/test.dart';

void main() {
  group('GithubReleasesService', () {
    GithubReleasesService githubReleasesService;
    String owner;
    String repo;
    setUpAll(() {
      owner = 'januwA';
      repo = 'flutter_anime_app';
      githubReleasesService = GithubReleasesService(owner: owner, repo: repo);
    });
    test('constructor', () {
      expect(githubReleasesService.owner, owner);
      expect(githubReleasesService.repo, repo);
    });

    test('url', () {
      expect(githubReleasesService.latestUrl,
          'https://api.github.com/repos/$owner/$repo/releases/latest');
      expect(githubReleasesService.releasesUrl,
          'https://api.github.com/repos/$owner/$repo/releases');
    });

    test('latest', () async {
      var data = await githubReleasesService.latest;
      expect(data != null, true);
      expect(githubReleasesService.latestSync != null, true);
    });

    test('releases', () async {
      var data = await githubReleasesService.releases;
      expect(data != null, true);
      expect(data.isNotEmpty, true);
      expect(githubReleasesService.releasesSync != null, true);
    });

    test('latestVertion', () async {
      String latestVertion = await githubReleasesService.latestVersion;
      expect(latestVertion != null, true);
    });

    tearDownAll(() async {
      githubReleasesService = null;
      owner = null;
      repo = null;
    });
  });

  group('VersionXYZ Test', () {
    test('0.1.0 > 1.1.1 is false', () {
      expect(VersionXYZ('0.1.0') > VersionXYZ('1.1.1'), false);
    });

    test('5.0.2 > 5.0.1 is true', () {
      expect(VersionXYZ('5.0.2') > VersionXYZ('5.0.1'), true);
    });

    test('5.0.2 > 0.3.1 is true', () {
      expect(VersionXYZ('5.0.2') > VersionXYZ('0.3.1'), true);
    });
    test('5.0.2 > [0,3,1] is true', () {
      expect(VersionXYZ('5.0.2') > VersionXYZ([0, 3, 1]), true);
    });
  });
}
