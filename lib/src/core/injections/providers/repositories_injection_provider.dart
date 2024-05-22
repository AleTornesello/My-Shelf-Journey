import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/book_volume_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/category_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/google_api_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_volume_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_category_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_google_api_repository.dart';

Future<void> initReporitoriesInjections() async {
  sl.registerLazySingleton<AbstractBookRepository>(
    () => BookRepository(sl()),
  );
  sl.registerLazySingleton<AbstractCategoryRepository>(
    () => CategoryRepository(sl()),
  );
  sl.registerLazySingleton<AbstractGoogleApiRepository>(
    () => GoogleApiRepository(sl()),
  );
  sl.registerLazySingleton<AbstractBookVolumeRepository>(
    () => BookVolumeRepository(sl()),
  );
}
