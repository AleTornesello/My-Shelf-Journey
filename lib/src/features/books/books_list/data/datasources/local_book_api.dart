import 'dart:async';

import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/data/datasources/local_db_connector.dart';
import 'package:sqflite/sqflite.dart';

class LocalBookApi extends AbstractBookApi {
  final LocalDbConnector _databaseConnector;
  static Database? _database;
  static const _tableName = 'books';

  LocalBookApi(
    this._databaseConnector,
  );

  Future<Database> get database async {
    _database ??= await _databaseConnector.open();
    return _database!;
  }

  @override
  Future<List<BookEntity>> getBooks(bool sort, int? categoryId) async {
    final db = await database;

    final List<Map<String, Object?>> result = await db.query(
      _tableName,
      orderBy: sort ? 'title' : 'id',
    );
    return [
      for (final {
            'id': id as int,
            'title': title as String,
            'imageUri': imageUri as String,
          } in result)
        BookEntity(
          id: id,
          title: title,
          imageUri: imageUri,
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
