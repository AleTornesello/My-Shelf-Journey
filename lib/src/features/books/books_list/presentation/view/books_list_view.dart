import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list.dart';

class BooksListView extends StatelessWidget {
  static const routeName = '/books-list';

  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('books'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DropdownButtonFormField(
              items: const [],
              onChanged: (item) {},
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text('aaaa'),
          const Expanded(
            child: BooksList(),
          ),
        ],
      ),
    );
  }
}
