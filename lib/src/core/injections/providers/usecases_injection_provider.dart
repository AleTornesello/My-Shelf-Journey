import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_volume_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/mark_book_volume_as_read_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/mark_book_volume_as_unread_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/search_book_from_jikan_usecase.dart';

Future<void> initUsecasesInjections() async {
  sl.registerSingleton(GetBooksUsecase(sl()));
  sl.registerSingleton(GetCategoriesUsecase(sl()));
  sl.registerSingleton(CreateBookFromIsbnUsecase(sl(), sl()));
  sl.registerSingleton(GetBookVolumesUsecase(sl()));
  sl.registerSingleton(CreateBookVolumeUsecase(sl()));
  sl.registerSingleton(MarkBookVolumeAsReadUsecase(sl()));
  sl.registerSingleton(MarkBookVolumeAsUnreadUsecase(sl()));
  sl.registerSingleton(CreateBookUsecase(sl()));
  sl.registerSingleton(SearchBookFromJikanUsecase(sl()));
}
