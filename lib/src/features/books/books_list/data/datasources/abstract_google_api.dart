import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/google_book_detail_entity.dart';

abstract class AbstractGoogleApi {
  Future<GoogleBookDetailEntity> getBookDetailByIsbn(String isbn);
}
