import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';
import 'package:my_shelf_journey_mobile/src/features/books/books_list/domain/models/book_volume_model.dart';
import 'package:my_shelf_journey_mobile/src/features/shared/presentation/widgets/inputs/text_field.dart';

class BookVolumeForm extends StatefulWidget {
  const BookVolumeForm({
    super.key,
    required this.onSubmit,
    this.volume,
    this.name,
  });

  final Function(String name) onSubmit;
  final BookVolumeModel? volume;
  final String? name;

  @override
  State<BookVolumeForm> createState() => _BookVolumeFormState();
}

class _BookVolumeFormState extends State<BookVolumeForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameFieldController = TextEditingController();

  @override
  void dispose() {
    _nameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.volume != null) {
      _nameFieldController.text = widget.volume!.name!;
    } else if (widget.name != null && widget.name!.isNotEmpty) {
      _nameFieldController.text = widget.name!;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MsjTextField(
            label: AppLocalizations.of(context)!.volumeName,
            mandatory: true,
            controller: _nameFieldController,
          ),
          const Gap(StylesConstants.gap),
          ElevatedButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              widget.onSubmit(_nameFieldController.text);
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
}
