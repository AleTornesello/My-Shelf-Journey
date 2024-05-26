import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/core/errors/failures.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final GetBooksUsecase getBooksUsecase;
  final CreateBookFromIsbnUsecase createBookFromIsbnUsecase;
  final CreateBookUsecase createBookUsecase;

  BooksBloc({
    required this.getBooksUsecase,
    required this.createBookFromIsbnUsecase,
    required this.createBookUsecase,
  }) : super(LoadingBooksState()) {
    on<OnGettingBooksEvent>(_onGettingBooksEvent);
    on<OnCreateBookEvent>(_onCreateBookEvent);
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
      GetBooksUsecaseParams(
        categoryId: event.categoryId,
        sort: event.sort,
      ),
    );
    result.fold((l) {
      emitter(ErrorGetBooksState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetBooksState(r));
    });
  }

  _onCreateBookEvent(
    OnCreateBookEvent event,
    Emitter<BooksState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(CreatingBooksState());
    }

    final result = await createBookUsecase.call(
      CreateBookUsecaseParams(event.book),
    );
    result.fold((l) {
      emitter(ErrorCreateBookState(l.errorMessage));
    }, (r) {
      emitter(SuccessCreateBookState());
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
      if (l is GoogleApiBookNotFoundFailure) {
        emitter(BookNotFoundState());
        return;
      }
      emitter(ErrorCreateBookState(l.errorMessage));
    }, (r) {
      emitter(SuccessCreateBookState());
    });
  }
}
