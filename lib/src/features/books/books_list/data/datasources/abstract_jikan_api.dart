import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/jikan_manga_entity.dart';

abstract class AbstractJikanApi {
  Future<JikanMangaEntity?> mangaSearch({
    required String query,
    int limit,
    int page,
  });
}
