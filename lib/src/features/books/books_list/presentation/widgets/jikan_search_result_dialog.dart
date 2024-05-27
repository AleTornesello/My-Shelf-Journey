import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/jikan_search_result_list.dart';

class JikanSearchResultDialog extends StatefulWidget {
  final JikanMangaModel jikanBook;

  const JikanSearchResultDialog(this.jikanBook, {super.key});

  @override
  State<JikanSearchResultDialog> createState() =>
      _JikanSearchResultDialogState();
}

class _JikanSearchResultDialogState extends State<JikanSearchResultDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksBloc, BooksState>(
      listener: (context, state) {
        if (state is SuccessCreateBookState) {
          loadBooks(context);
          Navigator.pop(context);
        } else if (state is ErrorCreateBookState) {
          Navigator.pop(context);
        } else if (state is BookNotFoundState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Text(
                AppLocalizations.of(context)!.jikanSearchResultDialogTitle,
              ),
          content: JikanSearchResultList(widget.jikanBook),
          actions: [
            TextButton(
              child: Text(
                AppLocalizations.of(context)!.cancel,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
