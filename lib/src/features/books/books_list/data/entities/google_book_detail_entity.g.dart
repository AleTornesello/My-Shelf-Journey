// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_book_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleBookDetailEntity _$GoogleBookDetailEntityFromJson(
        Map<String, dynamic> json) =>
    GoogleBookDetailEntity(
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoEntity.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleBookDetailEntityToJson(
        GoogleBookDetailEntity instance) =>
    <String, dynamic>{
      'volumeInfo': instance.volumeInfo,
    };

VolumeInfoEntity _$VolumeInfoEntityFromJson(Map<String, dynamic> json) =>
    VolumeInfoEntity(
      title: json['title'] as String?,
      imageLinks: json['imageLinks'] == null
          ? null
          : ImageLinksEntity.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolumeInfoEntityToJson(VolumeInfoEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageLinks': instance.imageLinks,
    };

ImageLinksEntity _$ImageLinksEntityFromJson(Map<String, dynamic> json) =>
    ImageLinksEntity(
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ImageLinksEntityToJson(ImageLinksEntity instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };
