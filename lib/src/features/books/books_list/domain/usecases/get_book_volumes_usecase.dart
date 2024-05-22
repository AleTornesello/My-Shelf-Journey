import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_volume_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class GetBookVolumesUsecaseParams {
  GetBookVolumesUsecaseParams(this.bookId, {this.sort = false});

  final int bookId;
  final bool sort;
}

class GetBookVolumesUsecase
    extends UseCase<List<BookVolumeModel>, GetBookVolumesUsecaseParams> {
  final AbstractBookVolumeRepository repository;

  GetBookVolumesUsecase(this.repository);

  @override
  Future<Either<Failure, List<BookVolumeModel>>> call(
    GetBookVolumesUsecaseParams params,
  ) async {
    final result = await repository.getBookVolumes(
      params.sort,
      params.bookId,
    );
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
