import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/jikan_manga_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';

class JikanMangaEntityMapper {
  static JikanMangaModel toModel(JikanMangaEntity entity) {
    return JikanMangaModel(
      data: entity.data!
          .map((JikanMangaEntityData e) => JikanMangaDataMapper.toModel(e))
          .toList(),
      pagination: JikanMangaPaginationMapper.toModel(entity.pagination!),
    );
  }

  static JikanMangaEntity toEntity(JikanMangaModel model) {
    return JikanMangaEntity(
      data: model.data!
          .map((JikanMangaModelData e) => JikanMangaDataMapper.toEntity(e))
          .toList(),
      pagination: JikanMangaPaginationMapper.toEntity(model.pagination!),
    );
  }
}

class JikanMangaDataMapper {
  static JikanMangaModelData toModel(JikanMangaEntityData entity) {
    return JikanMangaModelData(
      title: entity.title,
      titleEnglish: entity.titleEnglish,
      titleJapanese: entity.titleJapanese,
      volumes: entity.volumes,
      images: JikanMangaImagesMapper.toModel(entity.images!),
    );
  }

  static JikanMangaEntityData toEntity(JikanMangaModelData model) {
    return JikanMangaEntityData(
      title: model.title,
      titleEnglish: model.titleEnglish,
      titleJapanese: model.titleJapanese,
      volumes: model.volumes,
      images: JikanMangaImagesMapper.toEntity(model.images!),
    );
  }
}

class JikanMangaImagesMapper {
  static JikanMangaModelImages toModel(JikanMangaEntityImages entity) {
    return JikanMangaModelImages(
      jpg: JikanMangaJpgMapper.toModel(entity.jpg!),
      webp: JikanMangaJpgMapper.toModel(entity.webp!),
    );
  }

  static JikanMangaEntityImages toEntity(JikanMangaModelImages model) {
    return JikanMangaEntityImages(
      jpg: JikanMangaJpgMapper.toEntity(model.jpg!),
      webp: JikanMangaJpgMapper.toEntity(model.webp!),
    );
  }
}

class JikanMangaJpgMapper {
  static JikanMangaModelJpg toModel(JikanMangaEntityJpg entity) {
    return JikanMangaModelJpg(
      imageUrl: entity.imageUrl,
    );
  }

  static JikanMangaEntityJpg toEntity(JikanMangaModelJpg model) {
    return JikanMangaEntityJpg(
      imageUrl: model.imageUrl,
    );
  }
}

class JikanMangaPaginationMapper {
  static JikanMangaModelPagination toModel(JikanMangaEntityPagination entity) {
    return JikanMangaModelPagination(
      lastVisiblePage: entity.lastVisiblePage,
      hasNextPage: entity.hasNextPage,
      items: JikanMangaItemsMapper.toModel(entity.items!),
    );
  }

  static JikanMangaEntityPagination toEntity(JikanMangaModelPagination model) {
    return JikanMangaEntityPagination(
      lastVisiblePage: model.lastVisiblePage,
      hasNextPage: model.hasNextPage,
      items: JikanMangaItemsMapper.toEntity(model.items!),
    );
  }
}

class JikanMangaItemsMapper {
  static JikanMangaModelItems toModel(JikanMangaEntityItems entity) {
    return JikanMangaModelItems(
      count: entity.count,
      perPage: entity.perPage,
      total: entity.total,
    );
  }

  static JikanMangaEntityItems toEntity(JikanMangaModelItems model) {
    return JikanMangaEntityItems(
      count: model.count,
      perPage: model.perPage,
      total: model.total,
    );
  }
}
