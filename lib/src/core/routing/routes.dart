import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/view/book_detail_view.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/view/books_list_view.dart';

class Routes {
  static final Map<String, Widget> routes = HashMap.from({
    BooksListView.routeName: const BooksListView(),
    BookDetailView.routeName: const BookDetailView(),
    "**": const BooksListView()
  });

  static Route<dynamic>? generate(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        Widget? view = routes[routeSettings.name];

        if (view == null) {
          return const BooksListView();
        }

        return view;
      },
    );
  }
}
