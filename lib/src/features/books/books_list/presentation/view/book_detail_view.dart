import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/book_volumes_block/book_volumes_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_detail_hero.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_volumes_list.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';

class BookDetailView extends StatefulWidget {
  static const routeName = '/book-detail';

  const BookDetailView({super.key});

  @override
  State<BookDetailView> createState() => _BookDetailViewState();
}

class _BookDetailViewState extends State<BookDetailView> {
  List<BookVolumeModel> _volumes = [];

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as BookModel;

    return BlocProvider(
      create: (context) => BookVolumesBloc(
        getBookVolumesUsecase: sl<GetBookVolumesUsecase>(),
      )..add(OnGettingBookVolumesEvent(true, book.id!)),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: MsjAppBar(
            AppLocalizations.of(context)!.bookDetailViewTitle,
          ),
          body: Padding(
            padding: const EdgeInsets.all(StylesConstants.gap),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: BookDetailHero(book),
                ),
                const Gap(StylesConstants.gap),
                Row(children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.bookVolumes,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: open bottom sheet for volume creation
                    },
                    child: const Icon(Icons.add),
                  )
                ]),
                const Gap(StylesConstants.gap),
                Expanded(
                  child: BlocConsumer<BookVolumesBloc, BookVolumesState>(
                    listener: (context, state) {
                      if (state is SuccessGetBookVolumesState) {
                        _volumes = [];
                        _volumes = state.volumes;
                      }
                    },
                    builder: (context, state) {
                      return BookVolumesList(_volumes);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
