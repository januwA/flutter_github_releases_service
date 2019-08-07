import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_github_releases_service/dto/github_releases/github_releases.dto.dart';

part 'serializers.g.dart';

@SerializersFor(const [GithubReleasesDto])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();