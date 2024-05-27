import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';

class JikanSearchResultListItem extends StatelessWidget {
  final JikanMangaModelData book;

  const JikanSearchResultListItem(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            StylesConstants.borderRadius,
          ),
          child: book.images?.jpg?.imageUrl == null ||
                  book.images!.jpg!.imageUrl!.isEmpty
              ? Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: ColorConstants.gray200,
                  ),
                  child: const Icon(Icons.image),
                )
              : Image(
                  image:
                      CachedNetworkImageProvider(book.images!.jpg!.imageUrl!),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: ColorConstants.gray200,
                    ),
                    child: const Icon(Icons.image),
                  ),
                ),
        ),
        const Gap(StylesConstants.gap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (book.volumes != null) ...[
                const Gap(StylesConstants.gap),
                Chip(
                  label: Text(AppLocalizations.of(context)!
                      .jikanVolumesChipLabel(book.volumes!)),
                )
              ]
            ],
          ),
        ),
        const Gap(StylesConstants.gap),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check),
        )
      ],
    );
  }
}
