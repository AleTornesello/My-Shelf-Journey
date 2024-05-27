part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class LoadingBooksState extends BooksState {}

final class ErrorGetBooksState extends BooksState {
  final String errorMsg;
  const ErrorGetBooksState(this.errorMsg);
}

final class SuccessGetBooksState extends BooksState {
  final List<BookModel> books;
  const SuccessGetBooksState(this.books);
}

final class CreatingBooksState extends BooksState {}

final class ErrorCreateBookState extends BooksState {
  final String errorMsg;
  const ErrorCreateBookState(this.errorMsg);
}

final class BookNotFoundState extends BooksState {}

final class SuccessCreateBookState extends BooksState {}

final class LoadingJikanBooksState extends BooksState {}

final class ErrorGetJikanBooksState extends BooksState {
  final String errorMsg;
  const ErrorGetJikanBooksState(this.errorMsg);
}

final class SuccessGetJikanBooksState extends BooksState {
  final JikanMangaModel books;
  const SuccessGetJikanBooksState(this.books);
}
