part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

final class OnGettingBooksEvent extends BooksEvent {
  final int? categoryId;
  final bool withLoading;

  const OnGettingBooksEvent(
    this.withLoading, {
    this.categoryId,
  });
}

final class OnCreateBookFromIsbnEvent extends BooksEvent {
  final String isbn;
  final bool withLoading;

  const OnCreateBookFromIsbnEvent(
    this.withLoading,
    this.isbn,
  );
}
