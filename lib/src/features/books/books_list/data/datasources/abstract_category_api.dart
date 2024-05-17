import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/category_entity.dart';

abstract class AbstractCategoryApi {
  Future<List<CategoryEntity>> getCategories();
}
