import 'dart:async';

import 'package:dio/dio.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_google_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/google_book_detail_entity.dart';

class RemoteGoogleApi extends AbstractGoogleApi {
  RemoteGoogleApi();

  final dio = Dio();

  @override
  Future<GoogleBookDetailEntity?> getBookDetailByIsbn(String isbn) async {
    final response = await dio
        .get('https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn');

    if (response.data == null ||
        response.data["items"] == null ||
        response.data["items"].isEmpty) {
      return null;
    }

    return GoogleBookDetailEntity.fromJson(response.data["items"][0]);
  }
}
