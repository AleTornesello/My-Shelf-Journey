import 'package:dartz/dartz.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_google_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/mappers/google_api_book_detail_mapper.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/google_book_detail_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_google_api_repository.dart';

class GoogleApiRepository extends AbstractGoogleApiRepository {
  final AbstractGoogleApi _googleApi;

  GoogleApiRepository(
    this._googleApi,
  );

  @override
  Future<Either<Failure, GoogleBookDetailModel>> getBookDetailByIsbn(
      String isbn) async {
    try {
      final result = await _googleApi.getBookDetailByIsbn(isbn);

      if (result == null) {
        return const Left(GoogleApiBookNotFoundFailure());
      }

      final model = GoogleApiBookDetailMapper.toModel(result);
      return Right(model);
    } catch (e) {
      return Left(GoogleApiBooksFailure(e.toString()));
    }
  }
}
