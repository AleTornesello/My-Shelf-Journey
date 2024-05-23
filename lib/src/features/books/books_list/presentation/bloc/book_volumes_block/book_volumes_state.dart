part of 'book_volumes_bloc.dart';

sealed class BookVolumesState extends Equatable {
  const BookVolumesState();

  @override
  List<Object> get props => [];
}

final class BookVolumesInitial extends BookVolumesState {}

final class LoadingBookvolumesState extends BookVolumesState {}

final class ErrorGetBookVolumesState extends BookVolumesState {
  final String errorMsg;
  const ErrorGetBookVolumesState(this.errorMsg);
}

final class SuccessGetBookVolumesState extends BookVolumesState {
  final List<BookVolumeModel> volumes;
  const SuccessGetBookVolumesState(this.volumes);
}

final class CreatingBookVolumeState extends BookVolumesState {}

final class ErrorCreateBookVolumeState extends BookVolumesState {
  final String errorMsg;
  const ErrorCreateBookVolumeState(this.errorMsg);
}

final class SuccessCreateBookVolumeState extends BookVolumesState {}
