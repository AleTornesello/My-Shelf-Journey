import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';

abstract class AbstractJikanRepository {
  Future<Either<Failure, JikanMangaModel>> searchBooks(
    String title,
  );
}
