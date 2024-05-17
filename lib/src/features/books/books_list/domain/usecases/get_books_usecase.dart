import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class GetBooksUsecaseParams {
  GetBooksUsecaseParams({this.categoryId});

  final int? categoryId;
}

class GetBooksUsecase extends UseCase<List<BookModel>, GetBooksUsecaseParams> {
  final AbstractBookRepository repository;

  GetBooksUsecase(this.repository);

  @override
  Future<Either<Failure, List<BookModel>>> call(
    GetBooksUsecaseParams params,
  ) async {
    final result = await repository.getBooks(
      params.categoryId,
    );
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
