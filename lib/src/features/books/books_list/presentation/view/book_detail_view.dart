import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/jikan_manga_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/book_volumes_block/book_volumes_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/view/new_book_volume_view.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_detail_hero.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/book_volumes_list.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/jikan_search_result_dialog.dart';
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
    _loadVolumes(book);

    return Builder(
      builder: (context) {
        return BlocConsumer<BooksBloc, BooksState>(
          listener: (context, state) {
            if (state is SuccessGetJikanBooksState) {
              _jikanResultDialogBuilder(context, state.books);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: MsjAppBar(
                AppLocalizations.of(context)!.bookDetailViewTitle,
                actions: [
                  MsjAppBarAction(
                    label: AppLocalizations.of(context)!.importFromMal,
                    icon: Icons.download,
                    onTap: () {
                      _importBookMetadataFromJikan(book);
                    },
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(StylesConstants.padding2),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: BookDetailHero(book),
                    ),
                    const Gap(StylesConstants.gap),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.bookVolumes,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              NewBookVolumeView.routeName,
                              arguments: NewBookVolumeViewRouteArgs(
                                book.id!,
                                _volumes.length,
                              ),
                            );
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
                    const Gap(StylesConstants.gap),
                    Expanded(
                      child: BlocConsumer<BookVolumesBloc, BookVolumesState>(
                        listener: (context, state) {
                          if (state is SuccessGetBookVolumesState) {
                            _volumes = [];
                            _volumes = state.volumes;
                          } else if (state is SuccessCreateBookVolumeState) {
                            _loadVolumes(book);
                          } else if (state
                              is SuccessUpdateBookVolumeStatusState) {
                            _loadVolumes(book);
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
          },
        );
      },
    );
  }

  _loadVolumes(BookModel book) {
    BlocProvider.of<BookVolumesBloc>(context).add(
      OnGettingBookVolumesEvent(
        true,
        book.id!,
        sort: true,
      ),
    );
  }

  _importBookMetadataFromJikan(BookModel book) {
    BlocProvider.of<BooksBloc>(context).add(
      OnGettingJikanBooksEvent(
        book,
        withLoading: true,
      ),
    );
  }

  _jikanResultDialogBuilder(BuildContext context, JikanMangaModel result) {
    showDialog(
      context: context,
      builder: (context) {
        return JikanSearchResultDialog(result);
      },
    );
  }
}
