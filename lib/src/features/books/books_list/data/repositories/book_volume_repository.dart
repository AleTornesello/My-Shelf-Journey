import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_volume_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/book_volume_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_volume_repository.dart';

class BookVolumeRepository extends AbstractBookVolumeRepository {
  final AbstractBookVolumeApi _bookVolumeApi;

  BookVolumeRepository(
    this._bookVolumeApi,
  );

  @override
  Future<Either<Failure, List<BookVolumeModel>>> getBookVolumes(
    bool sort,
    int bookId,
  ) async {
    try {
      final results = await _bookVolumeApi.getBookVolumes(sort, bookId);
      final models = results.map((entity) {
        return BookVolumeMapper.toModel(entity);
      }).toList();
      return Right(models);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
