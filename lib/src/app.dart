import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/injections/msj_injections.dart';
import 'package:my_shelf_journey_mobile/src/core/routing/routes.dart';
import 'package:my_shelf_journey_mobile/src/core/theme/theme.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_from_isbn_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/create_book_volume_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_book_volumes_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_books_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/usecases/get_categories_usecase.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/book_volumes_block/book_volumes_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/books_block/books_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/categories_bloc/categories_bloc.dart';

class MyShelfJourney extends StatelessWidget {
  const MyShelfJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BooksBloc(
            getBooksUsecase: sl<GetBooksUsecase>(),
            createBookFromIsbnUsecase: sl<CreateBookFromIsbnUsecase>(),
          ),
        ),
        BlocProvider(
          create: (context) => CategoriesBloc(
            getCategoriesUsecase: sl<GetCategoriesUsecase>(),
          )..add(
              const OnGettingCategoriesEvent(true),
            ),
        ),
        BlocProvider(
          create: (context) => BookVolumesBloc(
            getBookVolumesUsecase: sl<GetBookVolumesUsecase>(),
            createBookVolumeUsecase: sl<CreateBookVolumeUsecase>(),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) {
          return AppLocalizations.of(context)!.appTitle;
        },
        restorationScopeId: 'app',
        theme: MsjThemeDataGenerator.generate(context),
        themeMode: ThemeMode.light,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('it'),
        ],
        onGenerateRoute: Routes.generate,
      ),
    );
  }
}
