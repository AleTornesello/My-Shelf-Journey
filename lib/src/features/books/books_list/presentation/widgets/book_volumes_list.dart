import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_volumes_list_item.dart';

class BookVolumesList extends StatelessWidget {
  final List<BookVolumeModel> volumes;

  const BookVolumesList(this.volumes, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StylesConstants.gap,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                for (final volume in volumes) BookVolumesListItem(volume),
                const Gap(StylesConstants.gap),
              ],
            ),
          );
        },
      ),
    );
  }
}
