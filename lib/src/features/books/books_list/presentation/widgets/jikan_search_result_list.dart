import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/jikan_search_result_list_item.dart';

class JikanSearchResultList extends StatelessWidget {
  final JikanMangaModel jikanBooks;

  const JikanSearchResultList(this.jikanBooks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final book in jikanBooks.data!) ...[
          JikanSearchResultListItem(book),
          const Gap(StylesConstants.gap)
        ],
      ],
    );
  }
}
