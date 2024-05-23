import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';

abstract class AbstractBookVolumeRepository {
  Future<Either<Failure, List<BookVolumeModel>>> getBookVolumes(
    bool sort,
    int bookId,
  );

  Future<Either<Failure, bool>> createBookVolume(
    BookVolumeModel volume,
  );

  Future<Either<Failure, bool>> setBookVolumeStatus(
    int volumeId,
    BookVolumeStatus newStatus,
  );
}
