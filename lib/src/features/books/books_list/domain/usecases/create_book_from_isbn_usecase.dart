import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_google_api_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class CreateBookFromIsbnUsecaseParams {
  CreateBookFromIsbnUsecaseParams(this.isbn);

  final String isbn;
}

class CreateBookFromIsbnUsecase
    extends UseCase<bool, CreateBookFromIsbnUsecaseParams> {
  final AbstractGoogleApiRepository googleApiBookrepository;
  final AbstractBookRepository bookRepository;

  CreateBookFromIsbnUsecase(this.googleApiBookrepository, this.bookRepository);

  @override
  Future<Either<Failure, bool>> call(
    CreateBookFromIsbnUsecaseParams params,
  ) async {
    final googleApiBookResult =
        await googleApiBookrepository.getBookDetailByIsbn(
      params.isbn,
    );
    return googleApiBookResult.fold(
      (l) {
        return Left(l);
      },
      (r) async {
        final bookResult = await createBook(
          r.volumeInfo!.title!,
          r.volumeInfo!.imageLinks!.smallThumbnail!,
        );

        return Right(bookResult);
      },
    );
  }

  Future<bool> createBook(String title, String imageUri) async {
    final bookResult = await bookRepository.createBook(BookModel(
      title: title,
      imageUri: imageUri,
    ));

    return bookResult.fold(
      (l) {
        return false;
      },
      (r) {
        return true;
      },
    );
  }
}
