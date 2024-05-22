import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';

class BookVolumesListItem extends StatelessWidget {
  final BookVolumeModel volume;

  const BookVolumesListItem(this.volume, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              volume.name!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   BookDetailView.routeName,
        //   arguments: book,
        // );
      },
    );
  }
}
