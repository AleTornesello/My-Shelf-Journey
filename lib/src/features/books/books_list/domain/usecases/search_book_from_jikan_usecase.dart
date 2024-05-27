import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_jikan_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

class SearchBookFromJikanUsecaseParams {
  SearchBookFromJikanUsecaseParams(this.book);

  final BookModel book;
}

class SearchBookFromJikanUsecase
    extends UseCase<JikanMangaModel, SearchBookFromJikanUsecaseParams> {
  final AbstractJikanRepository malRepository;

  SearchBookFromJikanUsecase(this.malRepository);

  @override
  Future<Either<Failure, JikanMangaModel>> call(
    SearchBookFromJikanUsecaseParams params,
  ) async {
    final result = await malRepository.searchBooks(params.book.title!);
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
