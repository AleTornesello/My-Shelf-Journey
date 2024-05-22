import 'dart:async';

import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_volume_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_volume_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/data/datasources/local_db_connector.dart';
import 'package:sqflite/sqflite.dart';

class LocalBookVolumeApi extends AbstractBookVolumeApi {
  final LocalDbConnector _databaseConnector;
  static Database? _database;
  static const _tableName = 'volumes';

  LocalBookVolumeApi(
    this._databaseConnector,
  );

  Future<Database> get database async {
    _database ??= await _databaseConnector.open();
    return _database!;
  }

  @override
  Future<List<BookVolumeEntity>> getBookVolumes(
    bool sort,
    int bookId,
  ) async {
    final db = await database;

    final List<Map<String, Object?>> result = await db.query(
      _tableName,
      orderBy: sort ? 'order' : 'id',
    );
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'orderIndex': orderIndex as int,
            'bookId': bookId as int,
          } in result)
        BookVolumeEntity(
          id: id,
          name: name,
          orderIndex: orderIndex,
          bookId: bookId,
        ),
    ];
  }

  @override
  Future<bool> createBook(BookEntity book) async {
    final db = await database;
    final result = await db.insert(
      _tableName,
      {
        'title': book.title,
        'imageUri': book.imageUri,
        'categoryId': 1,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return result > 0;
  }
}