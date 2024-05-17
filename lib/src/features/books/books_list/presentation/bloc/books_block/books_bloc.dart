import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUsecase getBooksUsecase;

  BooksBloc({required this.getBooksUsecase}) : super(LoadingBooksState()) {
    on<OnGettingBooksEvent>(_onGettingBooksEvent);
  }

  _onGettingBooksEvent(
      OnGettingBooksEvent event, Emitter<BooksState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingBooksState());
    }

    final result = await getBooksUsecase.call(
      GetBooksUsecaseParams(categoryId: event.categoryId),
    );
    result.fold((l) {
      emitter(ErrorGetBooksState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetBooksState(r));
    });
  }
}
