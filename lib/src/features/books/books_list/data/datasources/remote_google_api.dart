import 'dart:async';

import 'package:dio/dio.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_google_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/google_book_detail_entity.dart';

class RemoteGoogleApi extends AbstractGoogleApi {
  RemoteGoogleApi();

  final dio = Dio();

  @override
  Future<GoogleBookDetailEntity> getBookDetailByIsbn(String isbn) async {
    final response = await dio
        .get('https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn');
    return GoogleBookDetailEntity.fromJson(response.data["items"][0]);
  }
}
