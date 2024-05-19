import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUsecase getBooksUsecase;
  final CreateBookFromIsbnUsecase createBookFromIsbnUsecase;

  BooksBloc({
    required this.getBooksUsecase,
    required this.createBookFromIsbnUsecase,
  }) : super(LoadingBooksState()) {
    on<OnGettingBooksEvent>(_onGettingBooksEvent);
    on<OnCreateBookFromIsbnEvent>(_onCreateBookFromIsbnEvent);
  }

  _onGettingBooksEvent(
    OnGettingBooksEvent event,
    Emitter<BooksState> emitter,
  ) async {
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

  _onCreateBookFromIsbnEvent(
    OnCreateBookFromIsbnEvent event,
    Emitter<BooksState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(CreatingBooksState());
    }

    final result = await createBookFromIsbnUsecase.call(
      CreateBookFromIsbnUsecaseParams(event.isbn),
    );
    result.fold((l) {
      emitter(ErrorCreateBooksState(l.errorMessage));
    }, (r) {
      emitter(SuccessCreateBooksState());
    });
  }
}
