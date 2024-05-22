import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';

Future<void> initUsecasesInjections() async {
  sl.registerSingleton(GetBooksUsecase(sl()));
  sl.registerSingleton(GetCategoriesUsecase(sl()));
  sl.registerSingleton(CreateBookFromIsbnUsecase(sl(), sl()));
  sl.registerSingleton(GetBookVolumesUsecase(sl()));
}
