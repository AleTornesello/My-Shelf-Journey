import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_volume_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/mark_book_volume_as_read_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/mark_book_volume_as_unread_usecase.dart';

part 'book_volumes_event.dart';
part 'book_volumes_state.dart';

class BookVolumesBloc extends Bloc<BookVolumesEvent, BookVolumesState> {
  final GetBookVolumesUsecase getBookVolumesUsecase;
  final CreateBookVolumeUsecase createBookVolumeUsecase;
  final MarkBookVolumeAsReadUsecase markBookVolumeAsReadUsecase;
  final MarkBookVolumeAsUnreadUsecase markBookVolumeAsUnreadUsecase;

  BookVolumesBloc({
    required this.getBookVolumesUsecase,
    required this.createBookVolumeUsecase,
    required this.markBookVolumeAsReadUsecase,
    required this.markBookVolumeAsUnreadUsecase,
  }) : super(LoadingBookvolumesState()) {
    on<OnGettingBookVolumesEvent>(_onGettingBookVolumesEvent);
    on<OnCreateBookVolumeEvent>(_onCreateBookVolumeEvent);
    on<OnMarkBookVolumeAsReadEvent>(_onMarkBookVolumeAsReadEvent);
    on<OnMarkBookVolumeAsUnreadEvent>(_onMarkBookVolumeAsUnreadEvent);
  }

  _onGettingBookVolumesEvent(
    OnGettingBookVolumesEvent event,
    Emitter<BookVolumesState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(LoadingBookvolumesState());
    }

    final result = await getBookVolumesUsecase.call(
      GetBookVolumesUsecaseParams(
        event.bookId,
        sort: event.sort,
      ),
    );
    result.fold((l) {
      emitter(ErrorGetBookVolumesState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetBookVolumesState(r));
    });
  }

  _onCreateBookVolumeEvent(
    OnCreateBookVolumeEvent event,
    Emitter<BookVolumesState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(CreatingBookVolumeState());
    }

    final result = await createBookVolumeUsecase.call(
      CreateBookVolumeUsecaseParams(event.volume),
    );
    result.fold((l) {
      emitter(ErrorCreateBookVolumeState(l.errorMessage));
    }, (r) {
      emitter(SuccessCreateBookVolumeState());
    });
  }

  _onMarkBookVolumeAsReadEvent(
    OnMarkBookVolumeAsReadEvent event,
    Emitter<BookVolumesState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(UpdatingBookVolumeState());
    }

    final result = await markBookVolumeAsReadUsecase.call(
      MarkBookVolumeAsReadUsecaseParams(event.volumeId),
    );
    result.fold((l) {
      emitter(ErrorUpdateBookVolumeStatusState(l.errorMessage));
    }, (r) {
      emitter(SuccessUpdateBookVolumeStatusState());
    });
  }

  _onMarkBookVolumeAsUnreadEvent(
    OnMarkBookVolumeAsUnreadEvent event,
    Emitter<BookVolumesState> emitter,
  ) async {
    if (event.withLoading) {
      emitter(UpdatingBookVolumeState());
    }

    final result = await markBookVolumeAsUnreadUsecase.call(
      MarkBookVolumeAsUnreadUsecaseParams(event.volumeId),
    );
    result.fold((l) {
      emitter(ErrorUpdateBookVolumeStatusState(l.errorMessage));
    }, (r) {
      emitter(SuccessUpdateBookVolumeStatusState());
    });
  }
}
