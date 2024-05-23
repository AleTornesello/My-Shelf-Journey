import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_volume_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';

abstract class AbstractBookVolumeApi {
  Future<List<BookVolumeEntity>> getBookVolumes(
    bool sort,
    int bookId,
  );

  Future<bool> createBookVolume(
    BookVolumeEntity volume,
  );

  Future<bool> setBookVolumeStatus(
    int volumeId,
    BookVolumeStatus newStatus,
  );

  Future<bool> shiftBelowBookVolumes(int bookId, int fromOrderIndex);
}
