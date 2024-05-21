import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';

class BookMapper {
  static BookModel toModel(BookEntity entity) {
    return BookModel(
      id: entity.id,
      title: entity.title,
      imageUri: entity.imageUri,
      categoryId: entity.categoryId,
    );
  }

  static BookEntity toEntity(BookModel model) {
    return BookEntity(
      id: model.id,
      title: model.title,
      imageUri: model.imageUri,
      categoryId: model.categoryId,
    );
  }
}
