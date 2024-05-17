import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/category_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_category_repository.dart';

class CategoryRepository extends AbstractCategoryRepository {
  final AbstractCategoryApi _localCategoryApi;

  CategoryRepository(
    this._localCategoryApi,
  );

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final results = await _localCategoryApi.getCategories();
      final models = results.map((entity) {
        return CategoryMapper.toModel(entity);
      }).toList();
      return Right(models);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
