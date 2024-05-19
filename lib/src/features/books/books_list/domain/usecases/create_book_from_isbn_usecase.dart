import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_google_api_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class CreateBookFromIsbnUsecaseParams {
  CreateBookFromIsbnUsecaseParams(this.isbn);

  final String isbn;
}

class CreateBookFromIsbnUsecase
    extends UseCase<bool, CreateBookFromIsbnUsecaseParams> {
  final AbstractGoogleApiRepository repository;

  CreateBookFromIsbnUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    CreateBookFromIsbnUsecaseParams params,
  ) async {
    final result = await repository.getBookDetailByIsbn(
      params.isbn,
    );
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        return const Right(true);
      },
    );
  }
}
