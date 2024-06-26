import 'dart:async';

import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_volume_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/book_volume_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
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
      orderBy: sort ? 'orderIndex DESC' : 'id',
      where: 'bookId = ?',
      whereArgs: [bookId],
    );
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'orderIndex': orderIndex as int,
            'status': status as int,
            'bookId': bookId as int,
          } in result)
        BookVolumeEntity(
          id: id,
          name: name,
          orderIndex: orderIndex,
          status: status,
          bookId: bookId,
        ),
    ];
  }

  @override
  Future<bool> createBookVolume(BookVolumeEntity volume) async {
    final db = await database;
    final result = await db.insert(
      _tableName,
      {
        'name': volume.name,
        'orderIndex': volume.orderIndex,
        'status': BookVolumeStatus.notRead.value,
        'bookId': volume.bookId,
      },
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return result > 0;
  }

  @override
  Future<bool> setBookVolumeStatus(
    int volumeId,
    BookVolumeStatus newStatus,
  ) async {
    final db = await database;
    final result = await db.update(
      _tableName,
      {
        'status': newStatus.value,
      },
      where: 'id = ?',
      whereArgs: [volumeId],
    );
    return result > 0;
  }

  @override
  Future<bool> shiftBelowBookVolumes(int bookId, int fromOrderIndex) async {
    final db = await database;
    final queryResult = await db.query(
      _tableName,
      where: 'bookId = ? AND orderIndex >= ?',
      whereArgs: [bookId, fromOrderIndex],
    );
    for (var element in queryResult) {
      db.update(
        _tableName,
        {
          'orderIndex': (element['orderIndex'] as int) + 1,
        },
        where: 'id = ?',
        whereArgs: [element['id']],
      );
    }
    return queryResult.isNotEmpty;
  }
}
