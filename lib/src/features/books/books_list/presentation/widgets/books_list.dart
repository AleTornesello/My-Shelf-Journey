import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list_item.dart';

class BooksList extends StatelessWidget {
  final List<BookModel> books;

  const BooksList(this.books, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StylesConstants.gap,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          const itemMinWidth = 300;
          double itemWidth;

          if (maxWidth < itemMinWidth) {
            itemWidth = maxWidth;
          } else {
            final itemsCount = (maxWidth / itemMinWidth).floor();
            itemWidth = maxWidth / itemsCount;
          }
          return Wrap(
            runSpacing: StylesConstants.gap,
            children: [
              for (final book in books) BooksListItem(book, itemWidth)
            ],
          );
        },
      ),
    );
  }
}
