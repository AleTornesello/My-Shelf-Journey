import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class CreateBookUsecaseParams {
  CreateBookUsecaseParams(this.book);

  final BookModel book;
}

class CreateBookUsecase extends UseCase<bool, CreateBookUsecaseParams> {
  final AbstractBookRepository bookRepository;

  CreateBookUsecase(this.bookRepository);

  @override
  Future<Either<Failure, bool>> call(
    CreateBookUsecaseParams params,
  ) async {
    final bookResult = await bookRepository.createBook(params.book);
    return bookResult.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        return const Right(true);
      },
    );
  }
}
