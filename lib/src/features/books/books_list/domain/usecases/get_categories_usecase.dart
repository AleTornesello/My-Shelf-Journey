import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_category_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class GetCategoriesUsecase extends UseCase<List<CategoryModel>, NoParams> {
  final AbstractCategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoryModel>>> call(
    NoParams params,
  ) async {
    final result = await repository.getCategories();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
