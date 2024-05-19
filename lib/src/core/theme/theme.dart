import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/styles.dart';

class MsjThemeDataGenerator {
  static ThemeData generate(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorConstants.colorScheme,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            foregroundColor: ColorConstants.primary,
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                StylesConstants.borderRadius,
              ),
              side: const BorderSide(
                color: ColorConstants.primary,
              )),
        ),
      ),
    );
  }
}
