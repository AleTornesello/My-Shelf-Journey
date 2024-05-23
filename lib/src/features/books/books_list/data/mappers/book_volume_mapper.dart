import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_volume_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';

class BookVolumeMapper {
  static BookVolumeModel toModel(BookVolumeEntity entity) {
    return BookVolumeModel(
      id: entity.id,
      name: entity.name,
      orderIndex: entity.orderIndex,
      status: entity.status != null
          ? BookVolumeStatus.getByValue(entity.status!)
          : null,
      bookId: entity.bookId,
    );
  }

  static BookVolumeEntity toEntity(BookVolumeModel model) {
    return BookVolumeEntity(
      id: model.id,
      name: model.name,
      orderIndex: model.orderIndex,
      status: model.status?.value,
      bookId: model.bookId,
    );
  }
}
