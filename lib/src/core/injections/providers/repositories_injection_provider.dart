import 'package:get_it/get_it.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/data/repositories/category_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_book_repository.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/repositories/abstract_category_repository.dart';

final sl = GetIt.instance;

Future<void> initReporitoriesInjections() async {
  sl.registerLazySingleton<AbstractBookRepository>(
    () => BookRepository(sl()),
  );
  sl.registerLazySingleton<AbstractCategoryRepository>(
    () => CategoryRepository(sl()),
  );
}
