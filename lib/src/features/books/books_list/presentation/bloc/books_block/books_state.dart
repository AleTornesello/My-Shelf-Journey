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
