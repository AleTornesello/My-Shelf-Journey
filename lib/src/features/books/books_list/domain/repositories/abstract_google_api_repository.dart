import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/google_book_detail_model.dart';

abstract class AbstractGoogleApiRepository {
  Future<Either<Failure, GoogleBookDetailModel>> getBookDetailByIsbn(
      String isbn);
}
