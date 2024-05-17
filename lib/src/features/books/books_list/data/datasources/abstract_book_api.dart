import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_entity.dart';

abstract class AbstractBookApi {
  Future<List<BookEntity>> getBooks(int? categoryId);
}
