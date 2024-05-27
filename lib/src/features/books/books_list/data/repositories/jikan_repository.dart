import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_jikan_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/jikan_manga_entity_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_jikan_repository.dart';

class JikanRepository extends AbstractJikanRepository {
  final AbstractJikanApi _jikanApi;

  JikanRepository(
    this._jikanApi,
  );

  @override
  Future<Either<Failure, JikanMangaModel>> searchBooks(
    String title,
  ) async {
    try {
      final result = await _jikanApi.mangaSearch(query: title);

      final model = JikanMangaEntityMapper.toModel(result!);
      return Right(model);
    } catch (e) {
      return Left(GoogleApiBooksFailure(e.toString()));
    }
  }
}
