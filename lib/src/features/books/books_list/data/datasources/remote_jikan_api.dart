import 'package:dio/dio.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_jikan_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/jikan_manga_entity.dart';

class RemoteJikanApi extends AbstractJikanApi {
  final baseUrl = 'https://api.jikan.moe/v4';
  final dio = Dio();

  Future<Map<String, dynamic>> _getResponse(String url) async {
    Response response;
    do {
      response = await dio.get(baseUrl + url);
    } while (response.statusCode == 429 || response.statusCode == 500);

    return response.data;
  }

  @override
  Future<JikanMangaEntity?> mangaSearch({
    required String query,
    int limit = 5,
    int page = 1,
  }) async {
    var url = '/manga?page=$page&q=$query&limit=$limit&page=$page';

    var response = await _getResponse(url);

    return JikanMangaEntity.fromJson(response);
  }
}
