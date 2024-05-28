import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';

class MsjTextField extends StatelessWidget {
  const MsjTextField({
    super.key,
    required this.label,
    this.mandatory = false,
    this.controller,
  });

  final String label;
  final bool mandatory;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: mandatory
            ? label
            : AppLocalizations.of(context)!.optionalField(label),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.primary500,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(StylesConstants.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.primary500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(StylesConstants.borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.red500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(StylesConstants.borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorConstants.red500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(StylesConstants.borderRadius),
        ),
      ),
      validator: (value) {
        if (!mandatory) return null;

        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.requiredFieldError(label);
        }
        return null;
      },
    );
  }
}
