// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jikan_manga_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JikanMangaEntity _$JikanMangaEntityFromJson(Map<String, dynamic> json) =>
    JikanMangaEntity(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => JikanMangaEntityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : JikanMangaEntityPagination.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JikanMangaEntityToJson(JikanMangaEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };

JikanMangaEntityData _$JikanMangaEntityDataFromJson(
        Map<String, dynamic> json) =>
    JikanMangaEntityData(
      images: json['images'] == null
          ? null
          : JikanMangaEntityImages.fromJson(
              json['images'] as Map<String, dynamic>),
      title: json['title'] as String?,
      titleEnglish: json['title_english'] as String?,
      titleJapanese: json['title_japanese'] as String?,
      volumes: (json['volumes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JikanMangaEntityDataToJson(
        JikanMangaEntityData instance) =>
    <String, dynamic>{
      'images': instance.images,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_japanese': instance.titleJapanese,
      'volumes': instance.volumes,
    };

JikanMangaEntityPagination _$JikanMangaEntityPaginationFromJson(
        Map<String, dynamic> json) =>
    JikanMangaEntityPagination(
      lastVisiblePage: (json['lastVisiblePage'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      items: json['items'] == null
          ? null
          : JikanMangaEntityItems.fromJson(
              json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JikanMangaEntityPaginationToJson(
        JikanMangaEntityPagination instance) =>
    <String, dynamic>{
      'lastVisiblePage': instance.lastVisiblePage,
      'hasNextPage': instance.hasNextPage,
      'items': instance.items,
    };

JikanMangaEntityItems _$JikanMangaEntityItemsFromJson(
        Map<String, dynamic> json) =>
    JikanMangaEntityItems(
      count: (json['count'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JikanMangaEntityItemsToJson(
        JikanMangaEntityItems instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'perPage': instance.perPage,
    };

JikanMangaEntityImages _$JikanMangaEntityImagesFromJson(
        Map<String, dynamic> json) =>
    JikanMangaEntityImages(
      jpg: json['jpg'] == null
          ? null
          : JikanMangaEntityJpg.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: json['webp'] == null
          ? null
          : JikanMangaEntityJpg.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JikanMangaEntityImagesToJson(
        JikanMangaEntityImages instance) =>
    <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

JikanMangaEntityJpg _$JikanMangaEntityJpgFromJson(Map<String, dynamic> json) =>
    JikanMangaEntityJpg(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );

Map<String, dynamic> _$JikanMangaEntityJpgToJson(
        JikanMangaEntityJpg instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };
