import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_book_volume_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_google_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/abstract_jikan_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/local_book_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/local_book_volume_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/local_category_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/remote_google_api.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/datasources/remote_jikan_api.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/data/datasources/local_db_connector.dart';

// For future AbstractBookApi registrations: https://stackoverflow.com/a/70956433
// or use factory
Future<void> initDatasourcesInjections() async {
  sl.registerSingleton(LocalDbConnector());
  sl.registerLazySingleton<AbstractBookApi>(() => LocalBookApi(sl()));
  sl.registerLazySingleton<AbstractCategoryApi>(() => LocalCategoryApi(sl()));
  sl.registerLazySingleton<AbstractGoogleApi>(() => RemoteGoogleApi());
  sl.registerLazySingleton<AbstractBookVolumeApi>(
      () => LocalBookVolumeApi(sl()));
  sl.registerLazySingleton<AbstractJikanApi>(() => RemoteJikanApi());
}
