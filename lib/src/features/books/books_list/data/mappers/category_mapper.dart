import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/category_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';

class CategoryMapper {
  static CategoryModel toModel(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      translationKey: entity.translationKey,
    );
  }

  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      translationKey: model.translationKey,
    );
  }
}
