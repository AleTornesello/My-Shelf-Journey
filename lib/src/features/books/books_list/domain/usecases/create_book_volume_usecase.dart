import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_volume_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class CreateBookVolumeUsecaseParams {
  CreateBookVolumeUsecaseParams(this.volume);

  final BookVolumeModel volume;
}

class CreateBookVolumeUsecase
    extends UseCase<bool, CreateBookVolumeUsecaseParams> {
  final AbstractBookVolumeRepository bookVolumeRepository;

  CreateBookVolumeUsecase(this.bookVolumeRepository);

  @override
  Future<Either<Failure, bool>> call(
    CreateBookVolumeUsecaseParams params,
  ) async {
    final result = await bookVolumeRepository.createBookVolume(params.volume);
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
