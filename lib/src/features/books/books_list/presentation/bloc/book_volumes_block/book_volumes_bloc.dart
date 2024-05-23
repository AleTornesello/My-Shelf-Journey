import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_volume_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';

part 'book_volumes_event.dart';
part 'book_volumes_state.dart';

class BookVolumesBloc extends Bloc<BookVolumesEvent, BookVolumesState> {
  final GetBookVolumesUsecase getBookVolumesUsecase;
  final CreateBookVolumeUsecase createBookVolumeUsecase;

  BookVolumesBloc({
    required this.getBookVolumesUsecase,
    required this.createBookVolumeUsecase,
  }) : super(LoadingBookvolumesState()) {
    on<OnGettingBookVolumesEvent>(_onGettingBookVolumesEvent);
    on<OnCreateBookVolumeEvent>(_onCreateBookVolumeEvent);
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
}
