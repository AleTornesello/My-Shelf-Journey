import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';

abstract class AbstractCategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}
