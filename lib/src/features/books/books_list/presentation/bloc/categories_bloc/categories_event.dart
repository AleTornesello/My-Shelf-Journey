part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

final class OnGettingCategoriesEvent extends CategoriesEvent {
  final bool withLoading;

  const OnGettingCategoriesEvent(
    this.withLoading,
  );
}
