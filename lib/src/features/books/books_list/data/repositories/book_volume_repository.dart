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

  @override
  Future<Either<Failure, bool>> createBookVolume(
    BookVolumeModel volume,
  ) async {
    try {
      final entity = BookVolumeMapper.toEntity(volume);
      await _bookVolumeApi.shiftBelowBookVolumes(
        entity.bookId!,
        entity.orderIndex!,
      );
      await _bookVolumeApi.createBookVolume(entity);
      return const Right(true);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setBookVolumeStatus(
    int volumeId,
    BookVolumeStatus newStatus,
  ) async {
    try {
      await _bookVolumeApi.setBookVolumeStatus(volumeId, newStatus);
      return const Right(true);
    } catch (e) {
      return Left(LocalDbFailure(e.toString()));
    }
  }
}
