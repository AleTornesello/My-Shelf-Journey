import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/google_book_detail_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/google_book_detail_model.dart';

class GoogleApiBookDetailMapper {
  static GoogleBookDetailModel toModel(GoogleBookDetailEntity entity) {
    return GoogleBookDetailModel(
      volumeInfo: VolumeInfoMapper.toModel(entity.volumeInfo!),
    );
  }

  static GoogleBookDetailEntity toEntity(GoogleBookDetailModel model) {
    return GoogleBookDetailEntity(
      volumeInfo: VolumeInfoMapper.toEntity(model.volumeInfo!),
    );
  }
}

class VolumeInfoMapper {
  static VolumeInfoModel toModel(VolumeInfoEntity entity) {
    return VolumeInfoModel(
      title: entity.title,
      imageLinks: ImageLinksMapper.toModel(entity.imageLinks!),
    );
  }

  static VolumeInfoEntity toEntity(VolumeInfoModel model) {
    return VolumeInfoEntity(
      title: model.title,
      imageLinks: ImageLinksMapper.toEntity(model.imageLinks!),
    );
  }
}

class ImageLinksMapper {
  static ImageLinksModel toModel(ImageLinksEntity entity) {
    return ImageLinksModel(
      thumbnail: entity.thumbnail,
      smallThumbnail: entity.smallThumbnail,
    );
  }

  static ImageLinksEntity toEntity(ImageLinksModel model) {
    return ImageLinksEntity(
      thumbnail: model.thumbnail,
      smallThumbnail: model.smallThumbnail,
    );
  }
}
