import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/entities/category_entity.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/data/datasources/local_db_connector.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class LocalCategoryApi extends AbstractCategoryApi {
  final LocalDbConnector _databaseConnector;
  static Database? _database;
  static const _tableName = 'categories';

  LocalCategoryApi(
    this._databaseConnector,
  );

  Future<Database> get database async {
    _database ??= await _databaseConnector.open();
    return _database!;
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final db = await database;

    final List<Map<String, Object?>> result = await db.query(_tableName);
    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'translationKey': translationKey as String,
          } in result)
        CategoryEntity(id: id, name: name, translationKey: translationKey),
    ];
  }
}
