import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_form.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';

class NewBookView extends StatefulWidget {
  static const routeName = '/new-book';

  const NewBookView({super.key});

  @override
  State<NewBookView> createState() => _NewBookViewState();
}

class _NewBookViewState extends State<NewBookView> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: MsjAppBar(
          AppLocalizations.of(context)!.newBookViewTitle,
        ),
        body: Padding(
            padding: const EdgeInsets.all(StylesConstants.gap),
            child: BlocListener<BooksBloc, BooksState>(
              listener: (context, state) {
                if (state is SuccessCreateBookState) {
                  Navigator.pop(context);
                  // SuccessSnackBar.show(
                  //   context,
                  //   AppLocalizations.of(context)!.creatingBookOk,
                  // );
                } else if (state is ErrorCreateBookState) {
                  // ErrorSnackBar.show(
                  //   context,
                  //   AppLocalizations.of(context)!.creatingBookKo,
                  // );
                }
              },
              child: BookForm(
                onSubmit: (title, imageUri, categoryId) {
                  createBook(
                    context,
                    title,
                    imageUri,
                    categoryId,
                  );
                },
              ),
            )),
      );
    });
  }

  createBook(
    BuildContext context,
    String title,
    String imageUri,
    int categoryId, {
    bool withLoading = false,
  }) {
    BlocProvider.of<BooksBloc>(context).add(
      OnCreateBookEvent(
        withLoading,
        BookModel(
          title: title,
          imageUri: imageUri,
          categoryId: categoryId,
        ),
      ),
    );
  }
}
