import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/book_volumes_block/book_volumes_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_volume_form.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/error_snack_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/utils/snackbars/success_snack_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';

class NewBookVolumeViewRouteArgs {
  final int bookId;
  final int orderIndex;

  NewBookVolumeViewRouteArgs(
    this.bookId,
    this.orderIndex,
  );
}

class NewBookVolumeView extends StatefulWidget {
  static const routeName = '/new-book-volume';

  const NewBookVolumeView({super.key});

  @override
  State<NewBookVolumeView> createState() => _NewBookVolumeViewState();
}

class _NewBookVolumeViewState extends State<NewBookVolumeView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as NewBookVolumeViewRouteArgs;

    return Builder(builder: (context) {
      return Scaffold(
        appBar: MsjAppBar(
          AppLocalizations.of(context)!.newBookVolumeViewTitle,
        ),
        body: Padding(
            padding: const EdgeInsets.all(StylesConstants.gap),
            child: BlocListener<BookVolumesBloc, BookVolumesState>(
              listener: (context, state) {
                if (state is SuccessCreateBookVolumeState) {
                  Navigator.pop(context);
                  SuccessSnackBar.show(
                    context,
                    AppLocalizations.of(context)!.creatingBookVolumeOk,
                  );
                } else if (state is ErrorCreateBookVolumeState) {
                  ErrorSnackBar.show(
                    context,
                    AppLocalizations.of(context)!.creatingBookVolumeKo,
                  );
                }
              },
              child: BookVolumeForm(
                name: (args.orderIndex + 1).toString(),
                onSubmit: (name) {
                  createVolume(
                    context,
                    args.bookId,
                    name,
                    args.orderIndex,
                  );
                },
              ),
            )),
      );
    });
  }

  createVolume(
    BuildContext context,
    int bookId,
    String name,
    int orderIndex, {
    bool withLoading = false,
  }) {
    BlocProvider.of<BookVolumesBloc>(context).add(
      OnCreateBookVolumeEvent(
        withLoading,
        BookVolumeModel(
          bookId: bookId,
          name: name,
          orderIndex: orderIndex,
        ),
      ),
    );
  }
}
