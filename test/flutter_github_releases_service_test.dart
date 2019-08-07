import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_github_releases_service/flutter_github_releases_service.dart';

void main() {
  GithubReleasesService githubReleasesService;
  String owner;
  String repo;

  setUp(() async {
    owner = 'januwA';
    repo = 'flutter_anime_app';
    githubReleasesService = GithubReleasesService(owner: owner, repo: repo);
  });
  tearDown(() async {
    githubReleasesService = null;
    owner = null;
    repo = null;
  });
  group('GithubReleasesService', () {
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
      var data = await githubReleasesService.getLatest();
      expect(data != null, true);
    });

    test('releases', () async {
      var data = await githubReleasesService.getReleases();
      expect(data != null, true);
      expect(data.isNotEmpty, true);
    });

    test('latestVertion', () async {
      String latestVertion = await githubReleasesService.latestVersion;
      expect(latestVertion != null, true);
    });
  }, skip: 'ok');

  group('Version Test', () {
    test('0.1.1 > 0.1.0 is true', () {
      var v1 = VersionXYZ('0.1.0');
      var v2 = VersionXYZ('0.1.1');
      expect(v2 > v1, true);
    });

    test('5.0.2 > 5.0.1 is true', () {
      expect(VersionXYZ('5.0.2') > VersionXYZ('5.0.1'), true);
    });

    test('5.0.2 > 0.3.1 is true', () {
      expect(VersionXYZ('5.0.2') > VersionXYZ('0.3.1'), true);
    });
  }, skip: 'ok');
}
