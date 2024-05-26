import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/add_book_bottom_sheet.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/error_snack_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/success_snack_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/widgets/inputs/dropdown.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';

class BooksListView extends StatefulWidget {
  static const routeName = '/books-list';

  const BooksListView({super.key});

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  List<BookModel> _books = [];

  @override
  Widget build(BuildContext context) {
    loadCategories();

    return Builder(builder: (context) {
      return BlocConsumer<BooksBloc, BooksState>(
        listener: (context, state) {
          if (state is SuccessCreateBookState) {
            SuccessSnackBar.show(
              context,
              AppLocalizations.of(context)!.creatingBookOk,
            );
          } else if (state is ErrorCreateBookState) {
            ErrorSnackBar.show(
              context,
              AppLocalizations.of(context)!.creatingBookKo,
            );
          } else if (state is BookNotFoundState) {
            ErrorSnackBar.show(
              context,
              AppLocalizations.of(context)!.bookNotFound,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: MsjAppBar(
              AppLocalizations.of(context)!.booksListViewTitle,
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  BlocConsumer<CategoriesBloc, CategoriesState>(
                    listener: (context, state) {
                      if (state is SuccessGetCategoriesState) {
                        loadBooks(context, categoryId: state.categories[0].id);
                      }
                    },
                    builder: (context, state) {
                      if (state is SuccessGetCategoriesState) {
                        return Padding(
                          padding:
                              const EdgeInsets.all(StylesConstants.padding2),
                          child: MsjDropdown<int>(
                            label: AppLocalizations.of(context)!
                                .categoryDropdownLabel,
                            items: [
                              for (final category in state.categories)
                                SelectItem(
                                  getCategoryLabel(category),
                                  category.id!,
                                )
                            ],
                            onChanged: (item) {},
                            value: 1,
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: BlocConsumer<BooksBloc, BooksState>(
                        listener: (context, state) {
                      if (state is SuccessGetBooksState) {
                        _books = [];
                        _books = state.books;
                      }
                    }, builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: StylesConstants.padding2,
                        ),
                        child: BooksList(_books),
                      );
                    }),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final booksBloc = context.read<BooksBloc>();
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BlocProvider.value(
                        value: booksBloc,
                        child: const AddBookBottomSheet(),
                      );
                    });
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add),
            ),
          );
        },
      );
    });
  }

  loadBooks(
    BuildContext context, {
    int? categoryId,
    bool withLoading = true,
  }) {
    BlocProvider.of<BooksBloc>(context).add(
      OnGettingBooksEvent(
        withLoading,
        categoryId: categoryId,
        sort: true,
      ),
    );
  }

  loadCategories({bool withLoading = true}) {
    BlocProvider.of<CategoriesBloc>(context).add(
      const OnGettingCategoriesEvent(true),
    );
  }

  getCategoryLabel(CategoryModel category) {
    if (category.translationKey == null) {
      return category.name ?? '';
    }

    final labels = {
      'defaultCategoryLabel':
          AppLocalizations.of(context)!.defaultCategoryLabel,
    };

    return labels[category.translationKey] ?? '';
  }
}
