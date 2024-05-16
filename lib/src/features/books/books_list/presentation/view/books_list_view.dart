import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/widgets/books_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/app_bar.dart';
import 'package:my_shelf_journey_mobile/src/features/skeleton/presentation/widgets/inputs/dropdown.dart';

class BooksListView extends StatelessWidget {
  static const routeName = '/books-list';

  const BooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MsjAppBar(
        AppLocalizations.of(context)!.booksListViewTitle,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: MsjDropdown<int>(
                label: AppLocalizations.of(context)!.categoryDropdownLabel,
                items: [
                  SelectItem('Predefinito', 0),
                ],
                onChanged: (item) {},
                value: 0,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Expanded(
              child: BooksList(),
            ),
          ],
        ),
      ),
    );
  }
}
