import 'package:get_it/get_it.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';

final sl = GetIt.instance;

Future<void> initUsecasesInjections() async {
  sl.registerSingleton(GetBooksUsecase(sl()));
  sl.registerSingleton(GetCategoriesUsecase(sl()));
}
