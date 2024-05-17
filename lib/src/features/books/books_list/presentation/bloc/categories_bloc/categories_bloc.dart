import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/domain/usecases/usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  CategoriesBloc({required this.getCategoriesUsecase})
      : super(LoadingCategoriesState()) {
    on<OnGettingCategoriesEvent>(_onGettingCategoriesEvent);
  }

  _onGettingCategoriesEvent(
      OnGettingCategoriesEvent event, Emitter<CategoriesState> emitter) async {
    if (event.withLoading) {
      emitter(LoadingCategoriesState());
    }

    final result = await getCategoriesUsecase.call(
      NoParams(),
    );
    result.fold((l) {
      emitter(ErrorGetCategoriesState(l.errorMessage));
    }, (r) {
      emitter(SuccessGetCategoriesState(r));
    });
  }
}
