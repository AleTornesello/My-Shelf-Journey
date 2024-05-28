import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';

class MsjThemeDataGenerator {
  static ThemeData generate(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorConstants.colorScheme,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            foregroundColor: ColorConstants.primary500,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primary500,
          foregroundColor: ColorConstants.primaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              StylesConstants.borderRadius,
            ),
            side: const BorderSide(
              color: ColorConstants.primary500,
            ),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: ColorConstants.primary500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              StylesConstants.borderRadius,
            ),
          ),
        ),
      ),
      chipTheme: Theme.of(context).chipTheme.copyWith(
          backgroundColor: ColorConstants.primary100,
          labelPadding: const EdgeInsets.all(0),
          selectedColor: ColorConstants.primary500,
          side: const BorderSide(
            color: ColorConstants.primary500,
          ),
          labelStyle: Theme.of(context).chipTheme.labelStyle?.copyWith(
                color: ColorConstants.primary500,
              )
          // shape: const OutlinedBorder(
          //   side: BorderSide(color: ColorConstants.primary500),
          // ),
          ),
    );
  }
}
