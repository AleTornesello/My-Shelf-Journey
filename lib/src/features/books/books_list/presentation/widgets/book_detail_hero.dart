import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';

class BookDetailHero extends StatelessWidget {
  final BookModel book;

  const BookDetailHero(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            StylesConstants.borderRadius,
          ),
          child: book.imageUri == null || book.imageUri!.isEmpty
              ? Container(
                  width: 100,
                  height: 150,
                  decoration: const BoxDecoration(
                    color: ColorConstants.gray200,
                  ),
                  child: const Icon(Icons.image),
                )
              : Image(
                  image: CachedNetworkImageProvider(book.imageUri!),
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 100,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: ColorConstants.gray200,
                    ),
                    child: const Icon(Icons.image),
                  ),
                ),
        ),
        const Gap(StylesConstants.gap),
        Flexible(
          child: Text(
            book.title!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
