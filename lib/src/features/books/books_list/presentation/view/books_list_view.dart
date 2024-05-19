import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/add_book_bottom_sheet.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/inputs/dropdown.dart';

class BooksListView extends StatefulWidget {
  static const routeName = '/books-list';

  const BooksListView({super.key});

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView> {
  final BooksBloc _booksBloc = BooksBloc(
    getBooksUsecase: sl<GetBooksUsecase>(),
    createBookFromIsbnUsecase: sl<CreateBookFromIsbnUsecase>(),
  );
  final CategoriesBloc _categoriesBlock = CategoriesBloc(
    getCategoriesUsecase: sl<GetCategoriesUsecase>(),
  );

  @override
  void initState() {
    // loadBooks();
    loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MsjAppBar(
        AppLocalizations.of(context)!.booksListViewTitle,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            BlocConsumer<CategoriesBloc, CategoriesState>(
                bloc: _categoriesBlock,
                listener: (context, state) {
                  if (state is SuccessGetCategoriesState) {
                    loadBooks(categoryId: state.categories[0].id);
                  }
                },
                builder: (context, state) {
                  if (state is SuccessGetCategoriesState) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MsjDropdown<int>(
                        label:
                            AppLocalizations.of(context)!.categoryDropdownLabel,
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
                }),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: BlocBuilder<BooksBloc, BooksState>(
                  bloc: _booksBloc,
                  builder: (context, state) {
                    if (state is SuccessGetBooksState) {
                      return BooksList(state.books);
                    }
                    return const Text('si è verificato un errore');
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return const AddBookBottomSheet();
              });
        },
        // foregroundColor: customizations[index].$1,
        // backgroundColor: customizations[index].$2,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }

  loadBooks({
    int? categoryId,
    bool withLoading = true,
  }) {
    _booksBloc.add(
      OnGettingBooksEvent(
        withLoading,
        categoryId: categoryId,
      ),
    );
  }

  loadCategories({bool withLoading = true}) {
    _categoriesBlock.add(
      OnGettingCategoriesEvent(withLoading),
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
