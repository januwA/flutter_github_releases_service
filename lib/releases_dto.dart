class AssetDto {
  final String browserDownloadUrl;
  final String name;

  AssetDto._({this.browserDownloadUrl, this.name});

  static AssetDto fromJson(Map<String, dynamic> jsonMap) {
    return AssetDto._(
        name: jsonMap['name'],
        browserDownloadUrl: jsonMap['browser_download_url']);
  }

  static List<AssetDto> fromListJson(List<dynamic> jsonListMap) {
    return jsonListMap
        .map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

/// 通常github和gitee的releases都有相同，关键的api信息
class ReleasesDto {
  final int id;
  final String tagName;
  final String name;
  final List<AssetDto> assets;

  ReleasesDto._({this.id, this.tagName, this.name, this.assets});

  factory ReleasesDto.fromJson(Map<String, dynamic> jsonMap) {
    return ReleasesDto._(
        id: jsonMap['id'],
        tagName: jsonMap['tag_name'],
        name: jsonMap['name'],
        assets: AssetDto.fromListJson(jsonMap['assets']));
  }
}
