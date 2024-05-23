import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_volume_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class MarkBookVolumeAsUnreadUsecaseParams {
  MarkBookVolumeAsUnreadUsecaseParams(this.volumeId);

  final int volumeId;
}

class MarkBookVolumeAsUnreadUsecase
    extends UseCase<bool, MarkBookVolumeAsUnreadUsecaseParams> {
  final AbstractBookVolumeRepository bookVolumeRepository;

  MarkBookVolumeAsUnreadUsecase(this.bookVolumeRepository);

  @override
  Future<Either<Failure, bool>> call(
    MarkBookVolumeAsUnreadUsecaseParams params,
  ) async {
    final result = await bookVolumeRepository.setBookVolumeStatus(
        params.volumeId, BookVolumeStatus.notRead);
    return result.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        return Right(r);
      },
    );
  }
}
