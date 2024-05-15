import 'package:flutter/material.dart';
import 'package:my_shelf_journey_mobile/src/core/constants/colors.dart';

class MsjThemeDataGenerator {
  static ThemeData generate(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorConstants.colorScheme,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            foregroundColor: ColorConstants.primary,
          ),
    );
  }
}
