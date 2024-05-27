import 'package:json_annotation/json_annotation.dart';

part 'jikan_manga_entity.g.dart';

@JsonSerializable()
class JikanMangaEntity {
  const JikanMangaEntity({this.data, this.pagination});

  final List<JikanMangaEntityData>? data;
  final JikanMangaEntityPagination? pagination;

  factory JikanMangaEntity.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityToJson(this);
}

@JsonSerializable()
class JikanMangaEntityData {
  final JikanMangaEntityImages? images;
  final String? title;
  @JsonKey(name: 'title_english')
  final String? titleEnglish;
  @JsonKey(name: 'title_japanese')
  final String? titleJapanese;
  final int? volumes;

  const JikanMangaEntityData({
    this.images,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.volumes,
  });

  factory JikanMangaEntityData.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityDataFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityDataToJson(this);
}

@JsonSerializable()
class JikanMangaEntityPagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final JikanMangaEntityItems? items;

  const JikanMangaEntityPagination(
      {this.lastVisiblePage, this.hasNextPage, this.items});

  factory JikanMangaEntityPagination.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityPaginationFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityPaginationToJson(this);
}

@JsonSerializable()
class JikanMangaEntityItems {
  final int? count;
  final int? total;
  final int? perPage;

  const JikanMangaEntityItems({this.count, this.total, this.perPage});

  factory JikanMangaEntityItems.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityItemsFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityItemsToJson(this);
}

@JsonSerializable()
class JikanMangaEntityImages {
  final JikanMangaEntityJpg? jpg;
  final JikanMangaEntityJpg? webp;

  const JikanMangaEntityImages({this.jpg, this.webp});

  factory JikanMangaEntityImages.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityImagesFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityImagesToJson(this);
}

@JsonSerializable()
class JikanMangaEntityJpg {
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'small_image_url')
  final String? smallImageUrl;
  @JsonKey(name: 'large_image_url')
  final String? largeImageUrl;

  const JikanMangaEntityJpg(
      {this.imageUrl, this.smallImageUrl, this.largeImageUrl});

  factory JikanMangaEntityJpg.fromJson(Map<String, dynamic> json) =>
      _$JikanMangaEntityJpgFromJson(json);

  Map<String, dynamic> toJson() => _$JikanMangaEntityJpgToJson(this);
}
