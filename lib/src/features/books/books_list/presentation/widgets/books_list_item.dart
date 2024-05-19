import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';

class BooksListItem extends StatelessWidget {
  final BookModel book;
  final double width;

  const BooksListItem(this.book, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              StylesConstants.borderRadius,
            ),
            child: Image(
              image: CachedNetworkImageProvider(book.imageUri!),
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(StylesConstants.gap),
          Flexible(
            child: Text(
              book.title!,
              style: Theme.of(context).textTheme.titleLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
