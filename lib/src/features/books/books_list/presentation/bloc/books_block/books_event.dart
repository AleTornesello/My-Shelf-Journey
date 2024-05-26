part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

final class OnGettingBooksEvent extends BooksEvent {
  final int? categoryId;
  final bool withLoading;
  final bool sort;

  const OnGettingBooksEvent(
    this.withLoading, {
    this.categoryId,
    this.sort = false,
  });
}

final class OnCreateBookEvent extends BooksEvent {
  final BookModel book;
  final bool withLoading;

  const OnCreateBookEvent(
    this.withLoading,
    this.book,
  );
}

final class OnCreateBookFromIsbnEvent extends BooksEvent {
  final String isbn;
  final bool withLoading;

  const OnCreateBookFromIsbnEvent(
    this.withLoading,
    this.isbn,
  );
}
