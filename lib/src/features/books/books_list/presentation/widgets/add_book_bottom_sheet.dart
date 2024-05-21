import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/error_snack_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/success_snack_bar.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class AddBookBottomSheet extends StatefulWidget {
  const AddBookBottomSheet({super.key});

  @override
  State<AddBookBottomSheet> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<AddBookBottomSheet> {
  // final BooksBloc _booksBloc = BooksBloc(
  //   getBooksUsecase: sl<GetBooksUsecase>(),
  //   createBookFromIsbnUsecase: sl<CreateBookFromIsbnUsecase>(),
  // );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksBloc, BooksState>(
      listener: (context, state) {
        if (state is SuccessCreateBooksState) {
          loadBooks(context);
          Navigator.pop(context);
          SuccessSnackBar.show(
            context,
            AppLocalizations.of(context)!.creatingBookOk,
          );
        } else if (state is ErrorCreateBooksState) {
          Navigator.pop(context);
          ErrorSnackBar.show(
            context,
            AppLocalizations.of(context)!.creatingBookKo,
          );
        } else if (state is BookNotFoundState) {
          Navigator.pop(context);
          ErrorSnackBar.show(
            context,
            AppLocalizations.of(context)!.bookNotFound,
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(StylesConstants.gap2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  child: Row(
                    children: [
                      const Icon(Icons.barcode_reader),
                      const Gap(StylesConstants.gap),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.scanBookIsbnLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    var res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SimpleBarcodeScannerPage(),
                        ));
                    createBookFromIsbn(res, context);
                  },
                ),
                const Gap(StylesConstants.gap),
                ElevatedButton(
                  child: Row(
                    children: [
                      const Icon(Icons.edit),
                      const Gap(StylesConstants.gap),
                      Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!
                                .insertBookManuallyLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  createBookFromIsbn(
    String isbn,
    BuildContext context, {
    bool withLoading = true,
  }) {
    BlocProvider.of<BooksBloc>(context).add(
      OnCreateBookFromIsbnEvent(
        withLoading,
        isbn,
      ),
    );
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
}
