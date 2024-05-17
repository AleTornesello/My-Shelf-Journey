import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';

abstract class AbstractBookRepository {
  Future<Either<Failure, List<BookModel>>> getBooks(int? categoryId);
}
