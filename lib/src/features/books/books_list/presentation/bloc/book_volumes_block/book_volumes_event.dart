part of 'book_volumes_bloc.dart';

sealed class BookVolumesEvent extends Equatable {
  const BookVolumesEvent();

  @override
  List<Object> get props => [];
}

final class OnGettingBookVolumesEvent extends BookVolumesEvent {
  final int bookId;
  final bool withLoading;
  final bool sort;

  const OnGettingBookVolumesEvent(
    this.withLoading,
    this.bookId, {
    this.sort = false,
  });
}
