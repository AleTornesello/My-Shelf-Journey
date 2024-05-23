import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/book_volumes_block/book_volumes_bloc.dart';

class BookVolumesListItem extends StatelessWidget {
  final BookVolumeModel volume;

  const BookVolumesListItem(this.volume, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            decoration: BoxDecoration(
              color: volume.status == BookVolumeStatus.read
                  ? ColorConstants.primary
                  : ColorConstants.gray400,
              borderRadius: BorderRadius.circular(StylesConstants.borderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  volume.name!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const Gap(StylesConstants.gap),
          TextButton(
            onPressed: () {
              if (volume.status == BookVolumeStatus.read) {
                markVolumeAsUnread(context, volume.id!);
                return;
              }

              markVolumeAsRead(context, volume.id!);
            },
            child: Icon(
              volume.status == BookVolumeStatus.read
                  ? Icons.close
                  : Icons.check,
            ),
          )
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

  markVolumeAsRead(
    BuildContext context,
    int volumeId,
  ) {
    BlocProvider.of<BookVolumesBloc>(context).add(
      OnMarkBookVolumeAsReadEvent(volumeId),
    );
  }

  markVolumeAsUnread(
    BuildContext context,
    int volumeId,
  ) {
    BlocProvider.of<BookVolumesBloc>(context).add(
      OnMarkBookVolumeAsUnreadEvent(volumeId),
    );
  }
}
