import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';

part 'book_volumes_event.dart';
part 'book_volumes_state.dart';

class BookVolumesBloc extends Bloc<BookVolumesEvent, BookVolumesState> {
  final GetBookVolumesUsecase getBookVolumesUsecase;

  BookVolumesBloc({
    required this.getBookVolumesUsecase,
  }) : super(LoadingBookvolumesState()) {
    on<OnGettingBookVolumesEvent>(_onGettingBookVolumesEvent);
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
}
