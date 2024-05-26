import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list_item.dart';

class BooksList extends StatelessWidget {
  final List<BookModel> books;

  const BooksList(this.books, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
        return SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                runSpacing: StylesConstants.gap,
                children: [
                  for (final book in books) BooksListItem(book, itemWidth)
                ],
              ),
              const Gap(StylesConstants.gap),
            ],
          ),
        );
      },
    );
  }
}
