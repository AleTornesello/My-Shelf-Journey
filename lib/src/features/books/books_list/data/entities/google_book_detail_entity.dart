import 'package:json_annotation/json_annotation.dart';

part 'google_book_detail_entity.g.dart';

@JsonSerializable()
class GoogleBookDetailEntity {
  const GoogleBookDetailEntity({this.volumeInfo});

  final VolumeInfoEntity? volumeInfo;

  factory GoogleBookDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$GoogleBookDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleBookDetailEntityToJson(this);
}

@JsonSerializable()
class VolumeInfoEntity {
  String? title;
  ImageLinksEntity? imageLinks;

  VolumeInfoEntity({
    this.title,
    this.imageLinks,
  });

  factory VolumeInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VolumeInfoEntityToJson(this);
}

@JsonSerializable()
class ImageLinksEntity {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinksEntity({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinksEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageLinksEntityToJson(this);
}
