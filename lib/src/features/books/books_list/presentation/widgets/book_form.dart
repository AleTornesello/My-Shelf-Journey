import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/category_model.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/presentation/bloc/categories_bloc/categories_bloc.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/widgets/inputs/dropdown.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/widgets/inputs/text_field.dart';

class BookForm extends StatefulWidget {
  const BookForm({
    super.key,
    required this.onSubmit,
    this.book,
  });

  final Function(String title, String imageUri, int categoryId) onSubmit;
  final BookModel? book;

  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleFieldController = TextEditingController();
  final _imageUriFieldController = TextEditingController();
  final _categoryIdFieldController = TextEditingController();

  @override
  void dispose() {
    _titleFieldController.dispose();
    _imageUriFieldController.dispose();
    _categoryIdFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loadCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.book != null) {
      _titleFieldController.text = widget.book!.title!;
      _imageUriFieldController.text = widget.book!.imageUri!;
      _categoryIdFieldController.text = widget.book!.categoryId.toString();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MsjTextField(
            label: AppLocalizations.of(context)!.bookTitle,
            mandatory: true,
            controller: _titleFieldController,
          ),
          const Gap(StylesConstants.gap),
          MsjTextField(
            label: AppLocalizations.of(context)!.bookImageUri,
            controller: _imageUriFieldController,
          ),
          const Gap(StylesConstants.gap),
          BlocConsumer<CategoriesBloc, CategoriesState>(
            listener: (context, state) {
              if (state is SuccessGetCategoriesState && widget.book == null) {
                setDefaultCategory(state.categories);
              }
            },
            builder: (context, state) {
              if (state is SuccessGetCategoriesState) {
                return MsjDropdown<int>(
                  label: AppLocalizations.of(context)!.categoryDropdownLabel,
                  items: [
                    for (final category in state.categories)
                      SelectItem(
                        getCategoryLabel(category),
                        category.id!,
                      )
                  ],
                  onChanged: (item) {},
                  value: 1,
                );
              }

              return const SizedBox();
            },
          ),
          const Gap(StylesConstants.gap),
          ElevatedButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              widget.onSubmit(
                _titleFieldController.text,
                _imageUriFieldController.text,
                int.parse(_categoryIdFieldController.text),
              );
            },
            child: Row(
              children: [
                const Icon(Icons.save),
                const Gap(StylesConstants.gap),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.createVolume,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCategoryLabel(CategoryModel category) {
    if (category.translationKey == null) {
      return category.name ?? '';
    }

    final labels = {
      'defaultCategoryLabel':
          AppLocalizations.of(context)!.defaultCategoryLabel,
    };

    return labels[category.translationKey] ?? '';
  }

  setDefaultCategory(List<CategoryModel> categories) {
    _categoryIdFieldController.text = categories[0].id.toString();
  }

  loadCategories({bool withLoading = true}) {
    BlocProvider.of<CategoriesBloc>(context).add(
      const OnGettingCategoriesEvent(true),
    );
  }
}
