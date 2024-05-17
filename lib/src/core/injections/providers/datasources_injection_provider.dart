import 'package:get_it/get_it.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/local_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/local_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/data/datasources/local_db_connector.dart';

final sl = GetIt.instance;

// For future AbstractBookApi registrations: https://stackoverflow.com/a/70956433
Future<void> initDatasourcesInjections() async {
  sl.registerSingleton(LocalDbConnector());
  sl.registerLazySingleton<AbstractBookApi>(() => LocalBookApi(sl()));
  sl.registerLazySingleton<AbstractCategoryApi>(() => LocalCategoryApi(sl()));
}
