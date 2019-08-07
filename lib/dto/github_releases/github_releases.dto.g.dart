// GENERATED CODE - DO NOT MODIFY BY HAND

part of github_releases.dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GithubReleasesDto> _$githubReleasesDtoSerializer =
    new _$GithubReleasesDtoSerializer();
Serializer<AuthorDto> _$authorDtoSerializer = new _$AuthorDtoSerializer();
Serializer<AssetsDto> _$assetsDtoSerializer = new _$AssetsDtoSerializer();
Serializer<UploaderDto> _$uploaderDtoSerializer = new _$UploaderDtoSerializer();

class _$GithubReleasesDtoSerializer
    implements StructuredSerializer<GithubReleasesDto> {
  @override
  final Iterable<Type> types = const [GithubReleasesDto, _$GithubReleasesDto];
  @override
  final String wireName = 'GithubReleasesDto';

  @override
  Iterable<Object> serialize(Serializers serializers, GithubReleasesDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'assets_url',
      serializers.serialize(object.assetsUrl,
          specifiedType: const FullType(String)),
      'upload_url',
      serializers.serialize(object.uploadUrl,
          specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.htmlUrl,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'node_id',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'tag_name',
      serializers.serialize(object.tagName,
          specifiedType: const FullType(String)),
      'target_commitish',
      serializers.serialize(object.targetCommitish,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'draft',
      serializers.serialize(object.draft, specifiedType: const FullType(bool)),
      'author',
      serializers.serialize(object.author,
          specifiedType: const FullType(AuthorDto)),
      'prerelease',
      serializers.serialize(object.prerelease,
          specifiedType: const FullType(bool)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'published_at',
      serializers.serialize(object.publishedAt,
          specifiedType: const FullType(String)),
      'assets',
      serializers.serialize(object.assets,
          specifiedType:
              const FullType(BuiltList, const [const FullType(AssetsDto)])),
      'tarball_url',
      serializers.serialize(object.tarballUrl,
          specifiedType: const FullType(String)),
      'zipball_url',
      serializers.serialize(object.zipballUrl,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GithubReleasesDto deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GithubReleasesDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assets_url':
          result.assetsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'upload_url':
          result.uploadUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.htmlUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'node_id':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tag_name':
          result.tagName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'target_commitish':
          result.targetCommitish = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'draft':
          result.draft = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'author':
          result.author.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthorDto)) as AuthorDto);
          break;
        case 'prerelease':
          result.prerelease = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'published_at':
          result.publishedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'assets':
          result.assets.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(AssetsDto)]))
              as BuiltList<dynamic>);
          break;
        case 'tarball_url':
          result.tarballUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'zipball_url':
          result.zipballUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthorDtoSerializer implements StructuredSerializer<AuthorDto> {
  @override
  final Iterable<Type> types = const [AuthorDto, _$AuthorDto];
  @override
  final String wireName = 'AuthorDto';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthorDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'node_id',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'gravatar_id',
      serializers.serialize(object.gravatarId,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.htmlUrl,
          specifiedType: const FullType(String)),
      'followers_url',
      serializers.serialize(object.followersUrl,
          specifiedType: const FullType(String)),
      'following_url',
      serializers.serialize(object.followingUrl,
          specifiedType: const FullType(String)),
      'gists_url',
      serializers.serialize(object.gistsUrl,
          specifiedType: const FullType(String)),
      'starred_url',
      serializers.serialize(object.starredUrl,
          specifiedType: const FullType(String)),
      'subscriptions_url',
      serializers.serialize(object.subscriptionsUrl,
          specifiedType: const FullType(String)),
      'organizations_url',
      serializers.serialize(object.organizationsUrl,
          specifiedType: const FullType(String)),
      'repos_url',
      serializers.serialize(object.reposUrl,
          specifiedType: const FullType(String)),
      'events_url',
      serializers.serialize(object.eventsUrl,
          specifiedType: const FullType(String)),
      'received_events_url',
      serializers.serialize(object.receivedEventsUrl,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'site_admin',
      serializers.serialize(object.siteAdmin,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  AuthorDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthorDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'node_id':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar_url':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gravatar_id':
          result.gravatarId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.htmlUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'followers_url':
          result.followersUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'following_url':
          result.followingUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gists_url':
          result.gistsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'starred_url':
          result.starredUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subscriptions_url':
          result.subscriptionsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organizations_url':
          result.organizationsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'repos_url':
          result.reposUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'events_url':
          result.eventsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'received_events_url':
          result.receivedEventsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site_admin':
          result.siteAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AssetsDtoSerializer implements StructuredSerializer<AssetsDto> {
  @override
  final Iterable<Type> types = const [AssetsDto, _$AssetsDto];
  @override
  final String wireName = 'AssetsDto';

  @override
  Iterable<Object> serialize(Serializers serializers, AssetsDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'node_id',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'uploader',
      serializers.serialize(object.uploader,
          specifiedType: const FullType(UploaderDto)),
      'content_type',
      serializers.serialize(object.contentType,
          specifiedType: const FullType(String)),
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(String)),
      'size',
      serializers.serialize(object.size, specifiedType: const FullType(int)),
      'download_count',
      serializers.serialize(object.downloadCount,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
      'browser_download_url',
      serializers.serialize(object.browserDownloadUrl,
          specifiedType: const FullType(String)),
    ];
    if (object.label != null) {
      result
        ..add('label')
        ..add(serializers.serialize(object.label,
            specifiedType: const FullType(Null)));
    }
    return result;
  }

  @override
  AssetsDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AssetsDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'node_id':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(Null)) as Null;
          break;
        case 'uploader':
          result.uploader.replace(serializers.deserialize(value,
              specifiedType: const FullType(UploaderDto)) as UploaderDto);
          break;
        case 'content_type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'download_count':
          result.downloadCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'browser_download_url':
          result.browserDownloadUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UploaderDtoSerializer implements StructuredSerializer<UploaderDto> {
  @override
  final Iterable<Type> types = const [UploaderDto, _$UploaderDto];
  @override
  final String wireName = 'UploaderDto';

  @override
  Iterable<Object> serialize(Serializers serializers, UploaderDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'node_id',
      serializers.serialize(object.nodeId,
          specifiedType: const FullType(String)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'gravatar_id',
      serializers.serialize(object.gravatarId,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'html_url',
      serializers.serialize(object.htmlUrl,
          specifiedType: const FullType(String)),
      'followers_url',
      serializers.serialize(object.followersUrl,
          specifiedType: const FullType(String)),
      'following_url',
      serializers.serialize(object.followingUrl,
          specifiedType: const FullType(String)),
      'gists_url',
      serializers.serialize(object.gistsUrl,
          specifiedType: const FullType(String)),
      'starred_url',
      serializers.serialize(object.starredUrl,
          specifiedType: const FullType(String)),
      'subscriptions_url',
      serializers.serialize(object.subscriptionsUrl,
          specifiedType: const FullType(String)),
      'organizations_url',
      serializers.serialize(object.organizationsUrl,
          specifiedType: const FullType(String)),
      'repos_url',
      serializers.serialize(object.reposUrl,
          specifiedType: const FullType(String)),
      'events_url',
      serializers.serialize(object.eventsUrl,
          specifiedType: const FullType(String)),
      'received_events_url',
      serializers.serialize(object.receivedEventsUrl,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'site_admin',
      serializers.serialize(object.siteAdmin,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  UploaderDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UploaderDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'node_id':
          result.nodeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatar_url':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gravatar_id':
          result.gravatarId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'html_url':
          result.htmlUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'followers_url':
          result.followersUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'following_url':
          result.followingUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gists_url':
          result.gistsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'starred_url':
          result.starredUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subscriptions_url':
          result.subscriptionsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organizations_url':
          result.organizationsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'repos_url':
          result.reposUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'events_url':
          result.eventsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'received_events_url':
          result.receivedEventsUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'site_admin':
          result.siteAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GithubReleasesDto extends GithubReleasesDto {
  @override
  final String url;
  @override
  final String assetsUrl;
  @override
  final String uploadUrl;
  @override
  final String htmlUrl;
  @override
  final int id;
  @override
  final String nodeId;
  @override
  final String tagName;
  @override
  final String targetCommitish;
  @override
  final String name;
  @override
  final bool draft;
  @override
  final AuthorDto author;
  @override
  final bool prerelease;
  @override
  final String createdAt;
  @override
  final String publishedAt;
  @override
  final BuiltList<AssetsDto> assets;
  @override
  final String tarballUrl;
  @override
  final String zipballUrl;
  @override
  final String body;

  factory _$GithubReleasesDto(
          [void Function(GithubReleasesDtoBuilder) updates]) =>
      (new GithubReleasesDtoBuilder()..update(updates)).build();

  _$GithubReleasesDto._(
      {this.url,
      this.assetsUrl,
      this.uploadUrl,
      this.htmlUrl,
      this.id,
      this.nodeId,
      this.tagName,
      this.targetCommitish,
      this.name,
      this.draft,
      this.author,
      this.prerelease,
      this.createdAt,
      this.publishedAt,
      this.assets,
      this.tarballUrl,
      this.zipballUrl,
      this.body})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'url');
    }
    if (assetsUrl == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'assetsUrl');
    }
    if (uploadUrl == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'uploadUrl');
    }
    if (htmlUrl == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'htmlUrl');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'id');
    }
    if (nodeId == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'nodeId');
    }
    if (tagName == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'tagName');
    }
    if (targetCommitish == null) {
      throw new BuiltValueNullFieldError(
          'GithubReleasesDto', 'targetCommitish');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'name');
    }
    if (draft == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'draft');
    }
    if (author == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'author');
    }
    if (prerelease == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'prerelease');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'createdAt');
    }
    if (publishedAt == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'publishedAt');
    }
    if (assets == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'assets');
    }
    if (tarballUrl == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'tarballUrl');
    }
    if (zipballUrl == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'zipballUrl');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('GithubReleasesDto', 'body');
    }
  }

  @override
  GithubReleasesDto rebuild(void Function(GithubReleasesDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubReleasesDtoBuilder toBuilder() =>
      new GithubReleasesDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GithubReleasesDto &&
        url == other.url &&
        assetsUrl == other.assetsUrl &&
        uploadUrl == other.uploadUrl &&
        htmlUrl == other.htmlUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        tagName == other.tagName &&
        targetCommitish == other.targetCommitish &&
        name == other.name &&
        draft == other.draft &&
        author == other.author &&
        prerelease == other.prerelease &&
        createdAt == other.createdAt &&
        publishedAt == other.publishedAt &&
        assets == other.assets &&
        tarballUrl == other.tarballUrl &&
        zipballUrl == other.zipballUrl &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            url
                                                                                .hashCode),
                                                                        assetsUrl
                                                                            .hashCode),
                                                                    uploadUrl
                                                                        .hashCode),
                                                                htmlUrl
                                                                    .hashCode),
                                                            id.hashCode),
                                                        nodeId.hashCode),
                                                    tagName.hashCode),
                                                targetCommitish.hashCode),
                                            name.hashCode),
                                        draft.hashCode),
                                    author.hashCode),
                                prerelease.hashCode),
                            createdAt.hashCode),
                        publishedAt.hashCode),
                    assets.hashCode),
                tarballUrl.hashCode),
            zipballUrl.hashCode),
        body.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GithubReleasesDto')
          ..add('url', url)
          ..add('assetsUrl', assetsUrl)
          ..add('uploadUrl', uploadUrl)
          ..add('htmlUrl', htmlUrl)
          ..add('id', id)
          ..add('nodeId', nodeId)
          ..add('tagName', tagName)
          ..add('targetCommitish', targetCommitish)
          ..add('name', name)
          ..add('draft', draft)
          ..add('author', author)
          ..add('prerelease', prerelease)
          ..add('createdAt', createdAt)
          ..add('publishedAt', publishedAt)
          ..add('assets', assets)
          ..add('tarballUrl', tarballUrl)
          ..add('zipballUrl', zipballUrl)
          ..add('body', body))
        .toString();
  }
}

class GithubReleasesDtoBuilder
    implements Builder<GithubReleasesDto, GithubReleasesDtoBuilder> {
  _$GithubReleasesDto _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _assetsUrl;
  String get assetsUrl => _$this._assetsUrl;
  set assetsUrl(String assetsUrl) => _$this._assetsUrl = assetsUrl;

  String _uploadUrl;
  String get uploadUrl => _$this._uploadUrl;
  set uploadUrl(String uploadUrl) => _$this._uploadUrl = uploadUrl;

  String _htmlUrl;
  String get htmlUrl => _$this._htmlUrl;
  set htmlUrl(String htmlUrl) => _$this._htmlUrl = htmlUrl;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nodeId;
  String get nodeId => _$this._nodeId;
  set nodeId(String nodeId) => _$this._nodeId = nodeId;

  String _tagName;
  String get tagName => _$this._tagName;
  set tagName(String tagName) => _$this._tagName = tagName;

  String _targetCommitish;
  String get targetCommitish => _$this._targetCommitish;
  set targetCommitish(String targetCommitish) =>
      _$this._targetCommitish = targetCommitish;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _draft;
  bool get draft => _$this._draft;
  set draft(bool draft) => _$this._draft = draft;

  AuthorDtoBuilder _author;
  AuthorDtoBuilder get author => _$this._author ??= new AuthorDtoBuilder();
  set author(AuthorDtoBuilder author) => _$this._author = author;

  bool _prerelease;
  bool get prerelease => _$this._prerelease;
  set prerelease(bool prerelease) => _$this._prerelease = prerelease;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _publishedAt;
  String get publishedAt => _$this._publishedAt;
  set publishedAt(String publishedAt) => _$this._publishedAt = publishedAt;

  ListBuilder<AssetsDto> _assets;
  ListBuilder<AssetsDto> get assets =>
      _$this._assets ??= new ListBuilder<AssetsDto>();
  set assets(ListBuilder<AssetsDto> assets) => _$this._assets = assets;

  String _tarballUrl;
  String get tarballUrl => _$this._tarballUrl;
  set tarballUrl(String tarballUrl) => _$this._tarballUrl = tarballUrl;

  String _zipballUrl;
  String get zipballUrl => _$this._zipballUrl;
  set zipballUrl(String zipballUrl) => _$this._zipballUrl = zipballUrl;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  GithubReleasesDtoBuilder();

  GithubReleasesDtoBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _assetsUrl = _$v.assetsUrl;
      _uploadUrl = _$v.uploadUrl;
      _htmlUrl = _$v.htmlUrl;
      _id = _$v.id;
      _nodeId = _$v.nodeId;
      _tagName = _$v.tagName;
      _targetCommitish = _$v.targetCommitish;
      _name = _$v.name;
      _draft = _$v.draft;
      _author = _$v.author?.toBuilder();
      _prerelease = _$v.prerelease;
      _createdAt = _$v.createdAt;
      _publishedAt = _$v.publishedAt;
      _assets = _$v.assets?.toBuilder();
      _tarballUrl = _$v.tarballUrl;
      _zipballUrl = _$v.zipballUrl;
      _body = _$v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GithubReleasesDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GithubReleasesDto;
  }

  @override
  void update(void Function(GithubReleasesDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GithubReleasesDto build() {
    _$GithubReleasesDto _$result;
    try {
      _$result = _$v ??
          new _$GithubReleasesDto._(
              url: url,
              assetsUrl: assetsUrl,
              uploadUrl: uploadUrl,
              htmlUrl: htmlUrl,
              id: id,
              nodeId: nodeId,
              tagName: tagName,
              targetCommitish: targetCommitish,
              name: name,
              draft: draft,
              author: author.build(),
              prerelease: prerelease,
              createdAt: createdAt,
              publishedAt: publishedAt,
              assets: assets.build(),
              tarballUrl: tarballUrl,
              zipballUrl: zipballUrl,
              body: body);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'author';
        author.build();

        _$failedField = 'assets';
        assets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GithubReleasesDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$AuthorDto extends AuthorDto {
  @override
  final String login;
  @override
  final int id;
  @override
  final String nodeId;
  @override
  final String avatarUrl;
  @override
  final String gravatarId;
  @override
  final String url;
  @override
  final String htmlUrl;
  @override
  final String followersUrl;
  @override
  final String followingUrl;
  @override
  final String gistsUrl;
  @override
  final String starredUrl;
  @override
  final String subscriptionsUrl;
  @override
  final String organizationsUrl;
  @override
  final String reposUrl;
  @override
  final String eventsUrl;
  @override
  final String receivedEventsUrl;
  @override
  final String type;
  @override
  final bool siteAdmin;

  factory _$AuthorDto([void Function(AuthorDtoBuilder) updates]) =>
      (new AuthorDtoBuilder()..update(updates)).build();

  _$AuthorDto._(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin})
      : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'login');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'id');
    }
    if (nodeId == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'nodeId');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'avatarUrl');
    }
    if (gravatarId == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'gravatarId');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'url');
    }
    if (htmlUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'htmlUrl');
    }
    if (followersUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'followersUrl');
    }
    if (followingUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'followingUrl');
    }
    if (gistsUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'gistsUrl');
    }
    if (starredUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'starredUrl');
    }
    if (subscriptionsUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'subscriptionsUrl');
    }
    if (organizationsUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'organizationsUrl');
    }
    if (reposUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'reposUrl');
    }
    if (eventsUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'eventsUrl');
    }
    if (receivedEventsUrl == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'receivedEventsUrl');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'type');
    }
    if (siteAdmin == null) {
      throw new BuiltValueNullFieldError('AuthorDto', 'siteAdmin');
    }
  }

  @override
  AuthorDto rebuild(void Function(AuthorDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthorDtoBuilder toBuilder() => new AuthorDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthorDto &&
        login == other.login &&
        id == other.id &&
        nodeId == other.nodeId &&
        avatarUrl == other.avatarUrl &&
        gravatarId == other.gravatarId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        followersUrl == other.followersUrl &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        starredUrl == other.starredUrl &&
        subscriptionsUrl == other.subscriptionsUrl &&
        organizationsUrl == other.organizationsUrl &&
        reposUrl == other.reposUrl &&
        eventsUrl == other.eventsUrl &&
        receivedEventsUrl == other.receivedEventsUrl &&
        type == other.type &&
        siteAdmin == other.siteAdmin;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            login
                                                                                .hashCode),
                                                                        id
                                                                            .hashCode),
                                                                    nodeId
                                                                        .hashCode),
                                                                avatarUrl
                                                                    .hashCode),
                                                            gravatarId
                                                                .hashCode),
                                                        url.hashCode),
                                                    htmlUrl.hashCode),
                                                followersUrl.hashCode),
                                            followingUrl.hashCode),
                                        gistsUrl.hashCode),
                                    starredUrl.hashCode),
                                subscriptionsUrl.hashCode),
                            organizationsUrl.hashCode),
                        reposUrl.hashCode),
                    eventsUrl.hashCode),
                receivedEventsUrl.hashCode),
            type.hashCode),
        siteAdmin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthorDto')
          ..add('login', login)
          ..add('id', id)
          ..add('nodeId', nodeId)
          ..add('avatarUrl', avatarUrl)
          ..add('gravatarId', gravatarId)
          ..add('url', url)
          ..add('htmlUrl', htmlUrl)
          ..add('followersUrl', followersUrl)
          ..add('followingUrl', followingUrl)
          ..add('gistsUrl', gistsUrl)
          ..add('starredUrl', starredUrl)
          ..add('subscriptionsUrl', subscriptionsUrl)
          ..add('organizationsUrl', organizationsUrl)
          ..add('reposUrl', reposUrl)
          ..add('eventsUrl', eventsUrl)
          ..add('receivedEventsUrl', receivedEventsUrl)
          ..add('type', type)
          ..add('siteAdmin', siteAdmin))
        .toString();
  }
}

class AuthorDtoBuilder implements Builder<AuthorDto, AuthorDtoBuilder> {
  _$AuthorDto _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nodeId;
  String get nodeId => _$this._nodeId;
  set nodeId(String nodeId) => _$this._nodeId = nodeId;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _gravatarId;
  String get gravatarId => _$this._gravatarId;
  set gravatarId(String gravatarId) => _$this._gravatarId = gravatarId;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _htmlUrl;
  String get htmlUrl => _$this._htmlUrl;
  set htmlUrl(String htmlUrl) => _$this._htmlUrl = htmlUrl;

  String _followersUrl;
  String get followersUrl => _$this._followersUrl;
  set followersUrl(String followersUrl) => _$this._followersUrl = followersUrl;

  String _followingUrl;
  String get followingUrl => _$this._followingUrl;
  set followingUrl(String followingUrl) => _$this._followingUrl = followingUrl;

  String _gistsUrl;
  String get gistsUrl => _$this._gistsUrl;
  set gistsUrl(String gistsUrl) => _$this._gistsUrl = gistsUrl;

  String _starredUrl;
  String get starredUrl => _$this._starredUrl;
  set starredUrl(String starredUrl) => _$this._starredUrl = starredUrl;

  String _subscriptionsUrl;
  String get subscriptionsUrl => _$this._subscriptionsUrl;
  set subscriptionsUrl(String subscriptionsUrl) =>
      _$this._subscriptionsUrl = subscriptionsUrl;

  String _organizationsUrl;
  String get organizationsUrl => _$this._organizationsUrl;
  set organizationsUrl(String organizationsUrl) =>
      _$this._organizationsUrl = organizationsUrl;

  String _reposUrl;
  String get reposUrl => _$this._reposUrl;
  set reposUrl(String reposUrl) => _$this._reposUrl = reposUrl;

  String _eventsUrl;
  String get eventsUrl => _$this._eventsUrl;
  set eventsUrl(String eventsUrl) => _$this._eventsUrl = eventsUrl;

  String _receivedEventsUrl;
  String get receivedEventsUrl => _$this._receivedEventsUrl;
  set receivedEventsUrl(String receivedEventsUrl) =>
      _$this._receivedEventsUrl = receivedEventsUrl;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _siteAdmin;
  bool get siteAdmin => _$this._siteAdmin;
  set siteAdmin(bool siteAdmin) => _$this._siteAdmin = siteAdmin;

  AuthorDtoBuilder();

  AuthorDtoBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _id = _$v.id;
      _nodeId = _$v.nodeId;
      _avatarUrl = _$v.avatarUrl;
      _gravatarId = _$v.gravatarId;
      _url = _$v.url;
      _htmlUrl = _$v.htmlUrl;
      _followersUrl = _$v.followersUrl;
      _followingUrl = _$v.followingUrl;
      _gistsUrl = _$v.gistsUrl;
      _starredUrl = _$v.starredUrl;
      _subscriptionsUrl = _$v.subscriptionsUrl;
      _organizationsUrl = _$v.organizationsUrl;
      _reposUrl = _$v.reposUrl;
      _eventsUrl = _$v.eventsUrl;
      _receivedEventsUrl = _$v.receivedEventsUrl;
      _type = _$v.type;
      _siteAdmin = _$v.siteAdmin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthorDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthorDto;
  }

  @override
  void update(void Function(AuthorDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthorDto build() {
    final _$result = _$v ??
        new _$AuthorDto._(
            login: login,
            id: id,
            nodeId: nodeId,
            avatarUrl: avatarUrl,
            gravatarId: gravatarId,
            url: url,
            htmlUrl: htmlUrl,
            followersUrl: followersUrl,
            followingUrl: followingUrl,
            gistsUrl: gistsUrl,
            starredUrl: starredUrl,
            subscriptionsUrl: subscriptionsUrl,
            organizationsUrl: organizationsUrl,
            reposUrl: reposUrl,
            eventsUrl: eventsUrl,
            receivedEventsUrl: receivedEventsUrl,
            type: type,
            siteAdmin: siteAdmin);
    replace(_$result);
    return _$result;
  }
}

class _$AssetsDto extends AssetsDto {
  @override
  final String url;
  @override
  final int id;
  @override
  final String nodeId;
  @override
  final String name;
  @override
  final Null label;
  @override
  final UploaderDto uploader;
  @override
  final String contentType;
  @override
  final String state;
  @override
  final int size;
  @override
  final int downloadCount;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String browserDownloadUrl;

  factory _$AssetsDto([void Function(AssetsDtoBuilder) updates]) =>
      (new AssetsDtoBuilder()..update(updates)).build();

  _$AssetsDto._(
      {this.url,
      this.id,
      this.nodeId,
      this.name,
      this.label,
      this.uploader,
      this.contentType,
      this.state,
      this.size,
      this.downloadCount,
      this.createdAt,
      this.updatedAt,
      this.browserDownloadUrl})
      : super._() {
    if (url == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'url');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'id');
    }
    if (nodeId == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'nodeId');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'name');
    }
    if (uploader == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'uploader');
    }
    if (contentType == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'contentType');
    }
    if (state == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'state');
    }
    if (size == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'size');
    }
    if (downloadCount == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'downloadCount');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'updatedAt');
    }
    if (browserDownloadUrl == null) {
      throw new BuiltValueNullFieldError('AssetsDto', 'browserDownloadUrl');
    }
  }

  @override
  AssetsDto rebuild(void Function(AssetsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssetsDtoBuilder toBuilder() => new AssetsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetsDto &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        label == other.label &&
        uploader == other.uploader &&
        contentType == other.contentType &&
        state == other.state &&
        size == other.size &&
        downloadCount == other.downloadCount &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        browserDownloadUrl == other.browserDownloadUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, url.hashCode),
                                                    id.hashCode),
                                                nodeId.hashCode),
                                            name.hashCode),
                                        label.hashCode),
                                    uploader.hashCode),
                                contentType.hashCode),
                            state.hashCode),
                        size.hashCode),
                    downloadCount.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        browserDownloadUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssetsDto')
          ..add('url', url)
          ..add('id', id)
          ..add('nodeId', nodeId)
          ..add('name', name)
          ..add('label', label)
          ..add('uploader', uploader)
          ..add('contentType', contentType)
          ..add('state', state)
          ..add('size', size)
          ..add('downloadCount', downloadCount)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('browserDownloadUrl', browserDownloadUrl))
        .toString();
  }
}

class AssetsDtoBuilder implements Builder<AssetsDto, AssetsDtoBuilder> {
  _$AssetsDto _$v;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nodeId;
  String get nodeId => _$this._nodeId;
  set nodeId(String nodeId) => _$this._nodeId = nodeId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Null _label;
  Null get label => _$this._label;
  set label(Null label) => _$this._label = label;

  UploaderDtoBuilder _uploader;
  UploaderDtoBuilder get uploader =>
      _$this._uploader ??= new UploaderDtoBuilder();
  set uploader(UploaderDtoBuilder uploader) => _$this._uploader = uploader;

  String _contentType;
  String get contentType => _$this._contentType;
  set contentType(String contentType) => _$this._contentType = contentType;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  int _size;
  int get size => _$this._size;
  set size(int size) => _$this._size = size;

  int _downloadCount;
  int get downloadCount => _$this._downloadCount;
  set downloadCount(int downloadCount) => _$this._downloadCount = downloadCount;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  String _browserDownloadUrl;
  String get browserDownloadUrl => _$this._browserDownloadUrl;
  set browserDownloadUrl(String browserDownloadUrl) =>
      _$this._browserDownloadUrl = browserDownloadUrl;

  AssetsDtoBuilder();

  AssetsDtoBuilder get _$this {
    if (_$v != null) {
      _url = _$v.url;
      _id = _$v.id;
      _nodeId = _$v.nodeId;
      _name = _$v.name;
      _label = _$v.label;
      _uploader = _$v.uploader?.toBuilder();
      _contentType = _$v.contentType;
      _state = _$v.state;
      _size = _$v.size;
      _downloadCount = _$v.downloadCount;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _browserDownloadUrl = _$v.browserDownloadUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssetsDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssetsDto;
  }

  @override
  void update(void Function(AssetsDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssetsDto build() {
    _$AssetsDto _$result;
    try {
      _$result = _$v ??
          new _$AssetsDto._(
              url: url,
              id: id,
              nodeId: nodeId,
              name: name,
              label: label,
              uploader: uploader.build(),
              contentType: contentType,
              state: state,
              size: size,
              downloadCount: downloadCount,
              createdAt: createdAt,
              updatedAt: updatedAt,
              browserDownloadUrl: browserDownloadUrl);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'uploader';
        uploader.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AssetsDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$UploaderDto extends UploaderDto {
  @override
  final String login;
  @override
  final int id;
  @override
  final String nodeId;
  @override
  final String avatarUrl;
  @override
  final String gravatarId;
  @override
  final String url;
  @override
  final String htmlUrl;
  @override
  final String followersUrl;
  @override
  final String followingUrl;
  @override
  final String gistsUrl;
  @override
  final String starredUrl;
  @override
  final String subscriptionsUrl;
  @override
  final String organizationsUrl;
  @override
  final String reposUrl;
  @override
  final String eventsUrl;
  @override
  final String receivedEventsUrl;
  @override
  final String type;
  @override
  final bool siteAdmin;

  factory _$UploaderDto([void Function(UploaderDtoBuilder) updates]) =>
      (new UploaderDtoBuilder()..update(updates)).build();

  _$UploaderDto._(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin})
      : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'login');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'id');
    }
    if (nodeId == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'nodeId');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'avatarUrl');
    }
    if (gravatarId == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'gravatarId');
    }
    if (url == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'url');
    }
    if (htmlUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'htmlUrl');
    }
    if (followersUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'followersUrl');
    }
    if (followingUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'followingUrl');
    }
    if (gistsUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'gistsUrl');
    }
    if (starredUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'starredUrl');
    }
    if (subscriptionsUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'subscriptionsUrl');
    }
    if (organizationsUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'organizationsUrl');
    }
    if (reposUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'reposUrl');
    }
    if (eventsUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'eventsUrl');
    }
    if (receivedEventsUrl == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'receivedEventsUrl');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'type');
    }
    if (siteAdmin == null) {
      throw new BuiltValueNullFieldError('UploaderDto', 'siteAdmin');
    }
  }

  @override
  UploaderDto rebuild(void Function(UploaderDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UploaderDtoBuilder toBuilder() => new UploaderDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UploaderDto &&
        login == other.login &&
        id == other.id &&
        nodeId == other.nodeId &&
        avatarUrl == other.avatarUrl &&
        gravatarId == other.gravatarId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        followersUrl == other.followersUrl &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        starredUrl == other.starredUrl &&
        subscriptionsUrl == other.subscriptionsUrl &&
        organizationsUrl == other.organizationsUrl &&
        reposUrl == other.reposUrl &&
        eventsUrl == other.eventsUrl &&
        receivedEventsUrl == other.receivedEventsUrl &&
        type == other.type &&
        siteAdmin == other.siteAdmin;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            login
                                                                                .hashCode),
                                                                        id
                                                                            .hashCode),
                                                                    nodeId
                                                                        .hashCode),
                                                                avatarUrl
                                                                    .hashCode),
                                                            gravatarId
                                                                .hashCode),
                                                        url.hashCode),
                                                    htmlUrl.hashCode),
                                                followersUrl.hashCode),
                                            followingUrl.hashCode),
                                        gistsUrl.hashCode),
                                    starredUrl.hashCode),
                                subscriptionsUrl.hashCode),
                            organizationsUrl.hashCode),
                        reposUrl.hashCode),
                    eventsUrl.hashCode),
                receivedEventsUrl.hashCode),
            type.hashCode),
        siteAdmin.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UploaderDto')
          ..add('login', login)
          ..add('id', id)
          ..add('nodeId', nodeId)
          ..add('avatarUrl', avatarUrl)
          ..add('gravatarId', gravatarId)
          ..add('url', url)
          ..add('htmlUrl', htmlUrl)
          ..add('followersUrl', followersUrl)
          ..add('followingUrl', followingUrl)
          ..add('gistsUrl', gistsUrl)
          ..add('starredUrl', starredUrl)
          ..add('subscriptionsUrl', subscriptionsUrl)
          ..add('organizationsUrl', organizationsUrl)
          ..add('reposUrl', reposUrl)
          ..add('eventsUrl', eventsUrl)
          ..add('receivedEventsUrl', receivedEventsUrl)
          ..add('type', type)
          ..add('siteAdmin', siteAdmin))
        .toString();
  }
}

class UploaderDtoBuilder implements Builder<UploaderDto, UploaderDtoBuilder> {
  _$UploaderDto _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _nodeId;
  String get nodeId => _$this._nodeId;
  set nodeId(String nodeId) => _$this._nodeId = nodeId;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _gravatarId;
  String get gravatarId => _$this._gravatarId;
  set gravatarId(String gravatarId) => _$this._gravatarId = gravatarId;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  String _htmlUrl;
  String get htmlUrl => _$this._htmlUrl;
  set htmlUrl(String htmlUrl) => _$this._htmlUrl = htmlUrl;

  String _followersUrl;
  String get followersUrl => _$this._followersUrl;
  set followersUrl(String followersUrl) => _$this._followersUrl = followersUrl;

  String _followingUrl;
  String get followingUrl => _$this._followingUrl;
  set followingUrl(String followingUrl) => _$this._followingUrl = followingUrl;

  String _gistsUrl;
  String get gistsUrl => _$this._gistsUrl;
  set gistsUrl(String gistsUrl) => _$this._gistsUrl = gistsUrl;

  String _starredUrl;
  String get starredUrl => _$this._starredUrl;
  set starredUrl(String starredUrl) => _$this._starredUrl = starredUrl;

  String _subscriptionsUrl;
  String get subscriptionsUrl => _$this._subscriptionsUrl;
  set subscriptionsUrl(String subscriptionsUrl) =>
      _$this._subscriptionsUrl = subscriptionsUrl;

  String _organizationsUrl;
  String get organizationsUrl => _$this._organizationsUrl;
  set organizationsUrl(String organizationsUrl) =>
      _$this._organizationsUrl = organizationsUrl;

  String _reposUrl;
  String get reposUrl => _$this._reposUrl;
  set reposUrl(String reposUrl) => _$this._reposUrl = reposUrl;

  String _eventsUrl;
  String get eventsUrl => _$this._eventsUrl;
  set eventsUrl(String eventsUrl) => _$this._eventsUrl = eventsUrl;

  String _receivedEventsUrl;
  String get receivedEventsUrl => _$this._receivedEventsUrl;
  set receivedEventsUrl(String receivedEventsUrl) =>
      _$this._receivedEventsUrl = receivedEventsUrl;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _siteAdmin;
  bool get siteAdmin => _$this._siteAdmin;
  set siteAdmin(bool siteAdmin) => _$this._siteAdmin = siteAdmin;

  UploaderDtoBuilder();

  UploaderDtoBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _id = _$v.id;
      _nodeId = _$v.nodeId;
      _avatarUrl = _$v.avatarUrl;
      _gravatarId = _$v.gravatarId;
      _url = _$v.url;
      _htmlUrl = _$v.htmlUrl;
      _followersUrl = _$v.followersUrl;
      _followingUrl = _$v.followingUrl;
      _gistsUrl = _$v.gistsUrl;
      _starredUrl = _$v.starredUrl;
      _subscriptionsUrl = _$v.subscriptionsUrl;
      _organizationsUrl = _$v.organizationsUrl;
      _reposUrl = _$v.reposUrl;
      _eventsUrl = _$v.eventsUrl;
      _receivedEventsUrl = _$v.receivedEventsUrl;
      _type = _$v.type;
      _siteAdmin = _$v.siteAdmin;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UploaderDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UploaderDto;
  }

  @override
  void update(void Function(UploaderDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UploaderDto build() {
    final _$result = _$v ??
        new _$UploaderDto._(
            login: login,
            id: id,
            nodeId: nodeId,
            avatarUrl: avatarUrl,
            gravatarId: gravatarId,
            url: url,
            htmlUrl: htmlUrl,
            followersUrl: followersUrl,
            followingUrl: followingUrl,
            gistsUrl: gistsUrl,
            starredUrl: starredUrl,
            subscriptionsUrl: subscriptionsUrl,
            organizationsUrl: organizationsUrl,
            reposUrl: reposUrl,
            eventsUrl: eventsUrl,
            receivedEventsUrl: receivedEventsUrl,
            type: type,
            siteAdmin: siteAdmin);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
