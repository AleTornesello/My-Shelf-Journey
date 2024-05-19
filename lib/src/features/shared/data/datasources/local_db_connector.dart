import 'package:my_shelf_journey_mobile/src/core/constants/database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDbConnector {
  Future<Database> open() async {
    var path = join(
      await getDatabasesPath(),
      DatabaseConstants.databaseName,
    );
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await Future.any([
          db.execute(
            'CREATE TABLE books(id integer primary key, title varchar(255), imageUri varchar(255), categoryId integer, foreign key(categoryId) references categories(id))',
          ),
          db.execute(
            'CREATE TABLE categories(id integer primary key, name varchar(255), translationKey varchar(255))',
          )
        ]);
        await db.insert(
          'categories',
          {'name': 'Default', 'translationKey': 'defaultCategoryLabel'},
        );
      },
      version: 1,
    );
  }
}
