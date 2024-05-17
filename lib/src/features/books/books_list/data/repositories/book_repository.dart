import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/book_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';

class BookRepository extends AbstractBookRepository {
  final AbstractBookApi _localBookApi;

  BookRepository(
    this._localBookApi,
  );

  @override
  Future<Either<Failure, List<BookModel>>> getBooks(int? categoryId) async {
    try {
      final results = await _localBookApi.getBooks(categoryId);
      final models = results.map((entity) {
        return BookMapper.toModel(entity);
      }).toList();
      return Right(models);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
