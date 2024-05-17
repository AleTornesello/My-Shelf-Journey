part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class LoadingCategoriesState extends CategoriesState {}

final class ErrorGetCategoriesState extends CategoriesState {
  final String errorMsg;
  const ErrorGetCategoriesState(this.errorMsg);
}

final class SuccessGetCategoriesState extends CategoriesState {
  final List<CategoryModel> categories;
  const SuccessGetCategoriesState(this.categories);
}
