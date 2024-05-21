import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/book_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';

class BookRepository extends AbstractBookRepository {
  final AbstractBookApi _bookApi;

  BookRepository(
    this._bookApi,
  );

  @override
  Future<Either<Failure, List<BookModel>>> getBooks(
    bool sort,
    int? categoryId,
  ) async {
    try {
      final results = await _bookApi.getBooks(sort, categoryId);
      final models = results.map((entity) {
        return BookMapper.toModel(entity);
      }).toList();
      return Right(models);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createBook(BookModel book) async {
    try {
      await _bookApi.createBook(
        BookMapper.toEntity(book),
      );
      return const Right(true);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
