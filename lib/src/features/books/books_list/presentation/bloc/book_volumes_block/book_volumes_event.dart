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

final class OnCreateBookVolumeEvent extends BookVolumesEvent {
  final BookVolumeModel volume;
  final bool withLoading;

  const OnCreateBookVolumeEvent(
    this.withLoading,
    this.volume,
  );
}

final class OnMarkBookVolumeAsReadEvent extends BookVolumesEvent {
  final int volumeId;
  final bool withLoading;

  const OnMarkBookVolumeAsReadEvent(
    this.volumeId, {
    this.withLoading = false,
  });
}

final class OnMarkBookVolumeAsUnreadEvent extends BookVolumesEvent {
  final int volumeId;
  final bool withLoading;

  const OnMarkBookVolumeAsUnreadEvent(
    this.volumeId, {
    this.withLoading = false,
  });
}
