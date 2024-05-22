import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_volume_entity.dart';

abstract class AbstractBookVolumeApi {
  Future<List<BookVolumeEntity>> getBookVolumes(
    bool sort,
    int bookId,
  );
}
